import 'dart:async';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/core/injection/injectionservice.dart';
import 'package:ecommerce_app/core/routes/router.dart';
import 'package:ecommerce_app/core/widgets/CustomTextFormField.dart';
import 'package:ecommerce_app/features/Cart/Data/Repo/AddressRepo.dart';
import 'package:ecommerce_app/features/Cart/Data/Repo/Cartrepo.dart';
import 'package:ecommerce_app/features/Cart/Data/Services/AddressServices.dart';
import 'package:ecommerce_app/features/Cart/Data/Services/cartservices.dart';
import 'package:ecommerce_app/features/Cart/Data/model/Addressmodel.dart';
import 'package:ecommerce_app/features/Cart/Data/model/cartmodel.dart';
import 'package:ecommerce_app/features/Cart/presentation/model_view/Cubit/CartState.dart';
import 'package:ecommerce_app/features/Cart/presentation/model_view/Cubit/cartcubit.dart';
import 'package:ecommerce_app/features/Cart/presentation/views/OrderSuccess.dart';
import 'package:ecommerce_app/features/Cart/presentation/widgets/ChoosePaymentMethod.dart';
import 'package:ecommerce_app/features/Cart/presentation/widgets/CustomListViewAddress.dart';
import 'package:ecommerce_app/features/Orders/Data/Services/orderservices.dart';
import 'package:ecommerce_app/features/Orders/Data/model/ordermodel.dart';
import 'package:ecommerce_app/features/Settings/settingscubit/settingsbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
class CheckOutScreenView extends StatelessWidget {
  int totalprice;
  CheckOutScreenView({
   required this.totalprice
});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Addressmodel>>(
      future: context.read<CartCubit>().getAddressData(),
      builder: (context, snapshot) {
          return  Scaffold(
            floatingActionButton: SizedBox(
              width: 100.w,
              child: FloatingActionButton(
                child:  Text(context.read<SettingsCubit>().currentlang=="en"?"Check out":"الدفع"),
                onPressed: ()async{
        if( context.read<CartCubit>().paymentvalue=="")
        {
        ScaffoldMessenger.
        of(context).showSnackBar
          ( SnackBar(content:  Text(context.read<SettingsCubit>().currentlang=="en"?"fill the payment field":"من فضلك ادخل طريقة الدفع")));
        return;
        }
        await insertOrderData(context,totalprice);
                },
                backgroundColor: AppColor.main,
                elevation: 15.sp,
              ),
            ),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back,color: AppColor.main,size: 25.h,),
                              onPressed: () {
                                print(snapshot.data!.length);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: SizedBox(
                              height: 50.h,
                            )
                        ),
                        SliverToBoxAdapter(
                            child:Text(context.read<SettingsCubit>().currentlang=="en"?'Choose Payment Method':"اختر طريقة الدفع",style: Styles.Montserratblack24w700.copyWith(
                                fontSize: 15.sp,
                                color: AppColor.main
                            ),
                            )
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 20.h,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: ChoosePaymentMethod(),
                        ),

                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 20.h,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(context.read<SettingsCubit>().currentlang=="en"?"'Choose Address':":"اختر العنوان",style: Styles.Montserratblack24w700.copyWith(
                                fontSize: 15.sp,
                                color: AppColor.main
                            ),
                            ),
                          BlocBuilder<CartCubit,CartState>(
                            builder: (context, state) {
                              return   TextButton(onPressed:()async {
                                await showDialogBox(context.read<SettingsCubit>().currentlang=="en"?
                                "Add Address":"اضافة عنوان",context,() async {
                                  if(BlocProvider.of<CartCubit>(context).floor==null||
                                      BlocProvider.of<CartCubit>(context).name==""||
                                      BlocProvider.of<CartCubit>(context).Building==null||
                                      BlocProvider.of<CartCubit>(context).street==""||
                                      BlocProvider.of<CartCubit>(context).city=="please choose city"
                                  ){
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:const  Text("Fill all fields")));
                                  return;
                                  }
                                  await BlocProvider.of<CartCubit>(context).insertData(
                                      Addressmodel(
                                        name: BlocProvider.of<CartCubit>(context).name!,
                                        city: BlocProvider.of<CartCubit>(context).city,
                                        floor:BlocProvider.of<CartCubit>(context).floor!,
                                        Building: BlocProvider.of<CartCubit>(context).Building!,
                                        street: BlocProvider.of<CartCubit>(context).street,
                                      ));
                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BlocProvider(create: (context) =>
                                     CartCubit(addressServices:getitinstance<AddressRepo>() , cartServices: getitinstance<CartRepo>(),)
                                     ,child: CheckOutScreenView(totalprice: totalprice))));
                                },
                                  state
                                );
                              } , child: Text(context.read<SettingsCubit>().currentlang=="en"?'Add ':"اضافة",
                                  style: Styles.Montserratgrey16w300.copyWith(
                                    fontSize: 15.sp,
                                  )
                              )
                              );
                            }
                            ),
                        ]
                          )
                        ),
                        SliverToBoxAdapter(
                          child: BlocConsumer<CartCubit, CartState>(
                            listener: (context, state) {
                              if(state is AddressError) {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Something went wrong')));
                              }
                            },
                            builder: (context, state) {
                              if(snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColor.customPurple,
                                    )
                                );
                              }
                              if(snapshot.hasError) {
                                return Center(child: Text('${snapshot.error}'));
                              }
                          return ListView.builder(itemBuilder: (context, index) {
                            return CustomListViewAddress(

                              ontapcontainer: (){
                                BlocProvider.of<CartCubit>(context).selectAddress(index);
                              },
                              colorofcontainer:
                              BlocProvider.of<CartCubit>(context).selectedindex
                                  ==index?AppColor.main:AppColor.offWhite,
                           onpresseddelete: (s)async{
                             await BlocProvider.of<CartCubit>(context).
                             deleteAddressData(id: snapshot.data![index].id!);
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) =>
                                 BlocProvider(create: (context) =>
                                     CartCubit(cartServices: getitinstance<CartRepo>()
                                         , addressServices:getitinstance<AddressRepo>())
                                     ,child: CheckOutScreenView(totalprice: totalprice)
                                 )));

                           },
                                address: snapshot.data![index]);
                            },
                            itemCount: snapshot.data!.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                          );
                            },
                          ),
                        )
                      ]
                  ),
                ),
              )
          );
        }
    );
  }
Orders? order;
  Future<void> insertOrderData(BuildContext context,int totalprice ) async {
          try{
     order=Orders(
      totalprice:totalprice ,
        payment:
    context.read<CartCubit>().paymentvalue,
     status: "Pending"
    , date: DateFormat('yMMMd').format(DateTime.now()).toString(), delivery: 50);
    await context.read<CartCubit>().InsertOrderData(
    order!);
    // getCurrentLocation();
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  return BlocProvider(
    create: (context) {
      return CartCubit(addressServices:getitinstance<AddressRepo>() ,
        cartServices: getitinstance<CartRepo>(),
      );
    },
    child: OrderSplashScreen(
    ),
  );
}
)
);
    }catch(e){

    }
  }
}
Future showDialogBox(String name,BuildContext contextcubit,void Function() onpressed,CartState state) {
  return showDialog(context: contextcubit, builder: (context)
  {
    var citiesen=<String>[
      "Cairo",
      "Alex",
      "Giza",
    ];
    return
      AlertDialog(
          title:  Text(name),
          titleTextStyle: Styles.Montserratblack24w700,
          content:  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
               CustomTextFormField(onchange: (value) {
                 BlocProvider.of<CartCubit>(contextcubit).name=value;
               }, text: BlocProvider.of<SettingsCubit>(contextcubit).currentlang=="en"?
               "Enter Address":"ادخل العنوان", prefixIcon: Icons.location_on),
                  SizedBox(height: 15.h,),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(25.r),
                    elevation: 12.sp.toInt(),
                    isExpanded: true,
                    items: citiesen.map((e) =>
                        DropdownMenuItem
                                (value: e,child: Text(e))).toList(), onChanged: (String? value) {
                     BlocProvider.of<CartCubit>
                       (contextcubit).refreshChoice(value!);
                  },
                    hint:
                    Text( BlocProvider.of<CartCubit>(contextcubit).city
                      ,style: Styles.Montserratgrey16w300,),
                  ),
                  SizedBox(height: 15.h,),
                  CustomTextFormField(onchange: (text) {
                    BlocProvider.of<CartCubit>(contextcubit).street=text;
                  }, text: BlocProvider.of<SettingsCubit>(contextcubit).currentlang=="en"?"Enter Street":"ادخل الشارع", prefixIcon: Icons.streetview),
                  SizedBox(height: 15.h,),
                  CustomTextFormField(

  type: TextInputType.number
  ,onchange: (text) {
                    BlocProvider.of<CartCubit>(contextcubit).Building=int.parse(text);
                  }, text: BlocProvider.of<SettingsCubit>(contextcubit)
                      .currentlang=="en"?
                  "Enter Building":"ادخل البناء",
                      prefixIcon: Icons.home),
                  SizedBox(height: 15.h,),
                  CustomTextFormField(type: TextInputType.number,onchange: (text) {
                    BlocProvider.of<CartCubit>(contextcubit).floor=int.parse(text);
                  }, text:  BlocProvider.of<SettingsCubit>(contextcubit).currentlang=="en"?"Enter Floor":" ادخل الطابق", prefixIcon: Icons.storefront),
                ]
            ),

          actions: [
            state is InsertDataLoading?
         const CircularProgressIndicator(
            backgroundColor: AppColor.customPurple,
          )  :TextButton(
                onPressed: onpressed,
                child: Text( BlocProvider.of<SettingsCubit>(contextcubit).currentlang=="en"?"Done":"تم",style:Styles.Poppins14regular)),
  ]);
  });
}
