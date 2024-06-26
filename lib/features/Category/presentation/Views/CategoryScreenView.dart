import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/core/injection/injectionservice.dart';
import 'package:ecommerce_app/core/widgets/CustomTextFormField.dart';
import 'package:ecommerce_app/features/Cart/Data/Repo/Cartrepo.dart';
import 'package:ecommerce_app/core/model/Beautymodel.dart';
import 'package:ecommerce_app/features/Category/data/Model/ProductModel.dart';
import 'package:ecommerce_app/features/Category/presentation/model_view/category_bloc.dart';
import 'package:ecommerce_app/features/Category/presentation/model_view/category_state.dart';
import 'package:ecommerce_app/features/Favourites/Data/FavRepo/Favrepo.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_cubit.dart';
import 'package:ecommerce_app/features/DetailsHomeScreen/Presentation/Views/DetailsHomeScreen.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/CustomContainerCore.dart';
import 'package:ecommerce_app/features/Settings/settingscubit/settingsbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker_service/internet_connection_checker_service.dart';
class CategoryScreenView extends StatelessWidget {
  final int index;
  CategoryScreenView({required this.index});
  var onpressed=false;
  List<Product>? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:
     FutureBuilder<List<Product>>(
          builder: (context, snapshot) {
            return BlocConsumer<CategoryCubit, CategoryState>(
              listener: (context, state) {
                if (state is GetDataFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errormsg)));
                }
              },
              builder: (context, state) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: const CircularProgressIndicator(
                      backgroundColor: AppColor.customPurple,
                    ),
                  );
                }


               return Padding(
                  padding: EdgeInsets.all(7.sp),
                  child: SafeArea(
                    child: Column(
                      children: [
                        CustomTextFormField(onsubmit: (p0) {
                          if(p0.isEmpty){
                            onpressed=false;
                          }else{
                            onpressed=true;
                          }
                        },iconButton: IconButton(onPressed: (){
                          onpressed=false;
                          data=snapshot.data;
                          BlocProvider.of<CategoryCubit>(context).searchItem();

                  }, icon: Icon(Icons.close)),onchange: (value){

                          onpressed=true;
                       data=
                           snapshot.data?.where((element) =>
                           element.name.toUpperCase().contains(value)).toList();
                          BlocProvider.of<CategoryCubit>
                            (context).searchItem();
                        }, text: "Search".tr(), prefixIcon: Icons.search,),
                        SizedBox(height: 15.h,),
                    data?.length==0&&onpressed?Container(
                      child: Column(children: [
                        Image.asset("assets/Images/Animation - 1719283615786.gif",
                          height: 200.h,width: 200.w,fit: BoxFit.cover,),
                        SizedBox(height: 10.h,),
                        Text("no data available".tr(),style: Styles.Montserratblack24w700,)

                ]),
                    ):    Expanded(
                          child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.5,
                            crossAxisSpacing: 8.w,
                            mainAxisSpacing: 5.w,
                          ),
                          itemCount: onpressed==true?
                          data!.length:snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return CustomContainerHome(
                              tap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) =>
                                        BlocProvider(
                                          create: (context) =>
                                              FavCubit(getitinstance<FavRepo>(),
                                                  getitinstance<CartRepo>()),
                                          child: DetailsHomeScreen(
                                            data: BeautyModel(
                                                lang: context.locale. languageCode,
                                                size: onpressed?data![index].size:snapshot.data![index].size,

                                                price:  onpressed?data![index].price:snapshot.data![index].price,
                                                image: onpressed?data![index].image:snapshot.data![index].image,
                                                name: onpressed?data![index].name:snapshot.data![index].name
                                            ),
                                          ),
                                        ),));
                              },
                              image: onpressed?data![index].image:snapshot.data![index].image,
                            );
                          },),
                        ),
                    ]),
                  ),
                );
              },
            );
          },
          future: BlocProvider.of<CategoryCubit>(context).getData(
              getDataDependsOnCategoty(index)!, context),

      )
    );
  }
}

String? getDataDependsOnCategoty(int index) {
  if (index == 0) {
    return "Beauty";
  }
  else if (index == 1) {
    return "Kids";
  }
  else if (index == 2) {
    return "Mens";
  }
  else if (index == 3) {
    return "Womens";
  }
}
