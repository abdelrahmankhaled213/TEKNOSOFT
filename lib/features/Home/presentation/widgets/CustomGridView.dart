import 'package:ecommerce_app/core/injection/injectionservice.dart';
import 'package:ecommerce_app/features/Cart/Data/Repo/Cartrepo.dart';
import 'package:ecommerce_app/features/Favourites/Data/FavRepo/Favrepo.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_cubit.dart';
import 'package:ecommerce_app/features/DetailsHomeScreen/Presentation/Views/DetailsHomeScreen.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/CustomContainerCore.dart';
import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomGridView extends StatelessWidget{
List<HomeData>data;
CustomGridView({
  required this.data
});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics()
        ,itemCount: data.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1/1.5,
            mainAxisSpacing: 7.h,
            crossAxisSpacing: 7.w
        ), itemBuilder: (context, index) {
          return CustomContainerHome(
            tap: () {
             Navigator.of(context).push(MaterialPageRoute(
                 builder: (context) => BlocProvider(create: (context) =>
                     FavCubit(getitinstance<FavRepo>(), getitinstance<CartRepo>()),child: DetailsHomeScreen(data: data[index],))));
            },
            image:data[index].image ,
          );
        },
      ),
    );
  }
}