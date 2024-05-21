import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/core/injection/injectionservice.dart';
import 'package:ecommerce_app/core/widgets/custombutton.dart';
import 'package:ecommerce_app/features/Cart/Data/Repo/AddressRepo.dart';
import 'package:ecommerce_app/features/Cart/Data/Repo/Cartrepo.dart';
import 'package:ecommerce_app/features/Cart/Data/model/cartmodel.dart';
import 'package:ecommerce_app/features/Cart/presentation/model_view/Cubit/CartState.dart';
import 'package:ecommerce_app/features/Cart/presentation/model_view/Cubit/cartcubit.dart';
import 'package:ecommerce_app/features/Cart/presentation/views/CartHomeScreenView.dart';
import 'package:ecommerce_app/features/Cart/presentation/views/CartHomeScreenView.dart';
import 'package:ecommerce_app/features/Cart/presentation/views/CheckOut.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/customcontainer.dart';
import 'package:ecommerce_app/features/Settings/settingscubit/settingsbloc.dart';
import 'package:ecommerce_app/features/onBoardingScreen/Presentation/widgets/CustomText.rich.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CartScreenView extends StatefulWidget {
  @override
  State<CartScreenView> createState() => _CartScreenViewState();
}
class _CartScreenViewState extends State<CartScreenView> {
  var cartdata=<Cart>[];
  var text="";
  final instance=FirebaseFirestore.
  instance.collection('Cart');
   List<String>? docs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Cart>>(
        stream: instance.
        snapshots().map((event) => event.docs.map((k) {
      var cart=Cart.fromJson(k.data());
      cart.id=k.id;
          return cart ;
        }
        ).toList()),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColor.main,
              ),
            );
          }
          if(snapshot.hasData) {
            if(snapshot.data!.length==0) {
              return Center(
                child: Text("Your Cart is Empty",style: Styles.Montserratblack24w700.copyWith(
                  color: AppColor.main
                )),
              );
            }

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 230.h,
                      child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: CustomContainer(
                              child: CartContent(
                                cart: snapshot.data![index],
                              ),
                              width: 150.w,
                              height: 170.h,
                              color: AppColor.offWhite,
                              radius: 14.sp,
                              tap: () {},),
                          );
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Divider(
                      height:30.h ,
                      color: AppColor.main,
                    ),
                  ),
                    SliverToBoxAdapter(
                    child: SizedBox(
          height: 12.h,
          ),
                    ) ,
                  SliverToBoxAdapter(
                    child:PaymentSummary(cart: snapshot.data!)
                    ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 60.h,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: CustomButtonCore(text: S.of(context).Checkout, touch: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return BlocProvider(create: (context) =>
                              CartCubit(cartServices: getitinstance<CartRepo>()
                                  , addressServices: getitinstance<AddressRepo>())
                              ,child: CheckOutScreenView(
                               totalprice: calculateTotalPrice(cartlist: snapshot.data!),
                              ));
                        },));
                                }, color: AppColor.main),
                    )
                  )
                ]
              ),
            );
          }
          return const SizedBox();
        },
      )
      );
  }
}
class PaymentSummary extends StatelessWidget{
  List<Cart>cart;
  var deliveryfee=50;
  PaymentSummary({
    required this.cart
});
  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: EdgeInsets.symmetric(horizontal: 40.w),
     child: Container(
       height: 200.h,
       decoration: BoxDecoration(
         boxShadow: [
           BoxShadow(
             color: Theme.of(context).colorScheme.brightness==Brightness.dark?Colors.white:Colors.grey.withOpacity(0.5),
             spreadRadius: 5,
             blurRadius: 7,
             offset: Offset(0, 3), // changes position of shadow
           ),
         ],
         borderRadius: BorderRadius.circular(15.sp),
         border: Border.all(color: AppColor.offWhite),
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Align(
             alignment: Alignment.centerLeft,
             child: Text(context.read<SettingsCubit>().currentlang=="en"?"Payment Summary":"ملخص الدفع",style: Styles.Montserratblack24w700.copyWith(
               fontSize: 16.sp
             ),),
           ),
           CustomTextRich(
               ontap: (){},
               text:context.read<SettingsCubit>().currentlang=="en"?"price\t":" السعر\t",
               text2: "${calculateTotalPrice(cartlist: cart).toString()} Egp",
               textstyle1: Styles.Montserratgrey16w300,
               textstyle2:Styles.Montserratgrey16w300.copyWith(
                   color: AppColor.main
               )
           ),
           SizedBox(
             height: 7.h,
           ),
           CustomTextRich(
               ontap: (){},
               text: context.read<SettingsCubit>().currentlang=="en"?"Delivery fee\t"
                   :"التوصيل\t",
               text2: "$deliveryfee Egp",
               textstyle1: Styles.Montserratgrey16w300,
               textstyle2:Styles.Montserratgrey16w300.copyWith(
                   color: AppColor.main
               )
           ),
           SizedBox(
             height: 7.h,
           ),
           CustomTextRich(
               ontap: (){},
               text: context.read<SettingsCubit>().currentlang=="en"?"Total price\t":"المجموع\t",
               text2: "${calculateTotalPrice(cartlist: cart)+deliveryfee} ",
               textstyle1: Styles.Montserratgrey16w300,
               textstyle2:Styles.Montserratgrey16w300.copyWith(
                   color: AppColor.main
               )
           ),
           // Divider(
           //   color: AppColor.main,
           //   height: 30.h,
           // ),
         ],
       ),
     ),
   );
  }
}
class CartContent extends StatelessWidget {
  final Cart? cart;
  const CartContent({ required this.cart});
  @override
  Widget build(BuildContext context) {
    return  Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         SizedBox(
           height: 50.h,
           width: 150.w,
           child: Text(cart!.name,style: Styles.Montserratgrey16w300.copyWith(
             fontWeight: FontWeight.w600
           )),
         ),
            SizedBox(height: 5.h,),
           CustomTextRich(
               text: "${S.of(context).Price} :", textstyle1:Styles.Montserratgrey16w300 , textstyle2: Styles.Montserratgrey16w300.copyWith(
             color: AppColor.main,
           ), text2: " ${cart!.price}", ontap: () {},),
            SizedBox(height: 2.h,),
            CustomTextRich(
              text: context.read<SettingsCubit>().currentlang=="en"?"Quantity" :"كمية ", textstyle1:Styles.Montserratgrey16w300 , textstyle2: Styles.Montserratgrey16w300.copyWith(
              color: AppColor.main,
            ), text2: " ${cart!.Quantitiy}", ontap: () {},),
            SizedBox(height: 2.h,),
            CustomTextRich(
              text: context.read<SettingsCubit>().currentlang=="en"?"Size" :"حجم", textstyle1:Styles.Montserratgrey16w300 , textstyle2: Styles.Montserratgrey16w300.copyWith(
              color: AppColor.main,
            ), text2: " ${cart!.size}", ontap: () {},),

        ]),
        CachedNetworkImage(
          imageUrl:cart!.image ,
          placeholder: (context, url) {
            return Image.asset("assets/Images/Animation - 1711669824617.gif");
          },
          errorWidget: (context, url, error) {
            return Image.asset("assets/Images/Animation - 1715076571938.gif",fit: BoxFit.contain,);
          },
          fit: BoxFit.cover,
          height: 100.h,
        ),
    BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // if(state is CartDelete){
        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     content: Text("Deleted successfully"),
        //   ));
        // }
        // else if(state is CartDeleteError){
        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     content: Text(state.error),
        //   ));
        // }
      },
      builder: (context, state) {
        return GestureDetector(
            onTap: () async {
  await BlocProvider.of<CartCubit>(context).deleteData(cart!.id!);
        },
            child: Icon(
              Icons.remove_circle, color: AppColor.customred, size: 30.sp,));
      }
      )
      ],
    );
  }
}
int calculateTotalPrice({required List<Cart>cartlist}){
  var price=0;
  cartlist.forEach((element) {
    price+=element.price;
  });
  return price;
}