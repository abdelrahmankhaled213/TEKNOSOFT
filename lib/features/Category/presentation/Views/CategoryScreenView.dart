import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/injection/injectionservice.dart';
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
class CategoryScreenView extends StatelessWidget {
  final int index;
  CategoryScreenView({required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:FutureBuilder<List<Product>>(
       builder: (context, snapshot) {
         return BlocConsumer<CategoryCubit, CategoryState>(
           listener: (context, state) {
             if (state is GetDataFailed) {
               ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text(state.errormsg)));
             }
           },
           builder: (context, state) {
             if(snapshot.connectionState==ConnectionState.waiting){
               return Center(
                 child: const CircularProgressIndicator(
                   backgroundColor: AppColor.customPurple,
                 ),
               );
             }
             return Padding(
               padding: EdgeInsets.all(7.sp),
               child: GridView.builder(
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   childAspectRatio: 1 / 1.5,
                   crossAxisSpacing: 8.w,
                   mainAxisSpacing: 5.w,
                 ),
                 itemCount: snapshot.data!.length,
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
                                     lang: BlocProvider.of<SettingsCubit>(context).currentlang,
                                     size: snapshot.data![index].size,
                                     price: snapshot.data![index].price,
                                     image: snapshot.data![index].image,
                                     name: snapshot.data![index].name
                                   ),
                                 ),
                               ),));
                     },
                    image: snapshot.data![index].image,
                   );
                 },),
             );
           },
         );

       },
       future: BlocProvider.of<CategoryCubit>(context).getData(getDataDependsOnCategoty(index)!,context),
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
