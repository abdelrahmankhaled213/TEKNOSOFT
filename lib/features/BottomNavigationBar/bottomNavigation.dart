import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/core/injection/injectionservice.dart';
import 'package:ecommerce_app/core/networking/Networking_Bloc.dart';
import 'package:ecommerce_app/features/Cart/Data/Repo/AddressRepo.dart';
import 'package:ecommerce_app/features/Cart/Data/Repo/Cartrepo.dart';
import 'package:ecommerce_app/features/Cart/presentation/model_view/Cubit/cartcubit.dart';
import 'package:ecommerce_app/features/Cart/presentation/views/CartHomeScreenView.dart';
import 'package:ecommerce_app/features/Favourites/Data/FavRepo/Favrepo.dart';
import 'package:ecommerce_app/features/Favourites/presentation/Ui/FavouritesScreenView.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_cubit.dart';
import 'package:ecommerce_app/features/Home/Data/Repo/homerepo.dart';
import 'package:ecommerce_app/features/Home/presentation/Ui/homescreenview.dart';
import 'package:ecommerce_app/features/Home/presentation/model_view/home_cubit.dart';
import 'package:ecommerce_app/features/Settings/views/SettingsScreenView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BottomNavigationBarView extends StatefulWidget {
  @override
  State<BottomNavigationBarView> createState() => _BottomNavigationBarViewState();
}
class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
   var currentindex=0;
List<Widget>screens=[
  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeCubit(getitinstance<HomeRepo>()),
        ),
        BlocProvider(create: (context) {
          return NetworkingBloc();
        },

        )
      ],
    child: HomeScreenView(),
    ),

  BlocProvider(create: (context) => FavCubit(getitinstance<FavRepo>(),getitinstance<CartRepo>()),
      child: FavouritesScreenView(
      )
  ),
   BlocProvider(
       create: (context) => CartCubit( cartServices: getitinstance<CartRepo>(), addressServices: getitinstance<AddressRepo>())
       ,child: CartScreenView()),

     SettingsScreenView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 76.h,
        width: 375.w,
        child: BottomNavigationBar(unselectedFontSize: 10.sp,backgroundColor:
        Theme.of(context).colorScheme.brightness==Brightness.dark
            ?Colors.transparent:Colors.white,type: BottomNavigationBarType.fixed,elevation: 0.0,selectedLabelStyle: Styles.Montserratblack24w700.copyWith(
          fontSize: 10.sp
        ),currentIndex: currentindex,selectedItemColor: AppColor.customred,onTap: (value) {
    currentindex   =value;
          setState(() {

          });
        },
          items: [
          BottomNavigationBarItem
            (icon:  Icon(Icons.home,size: 24.h,),label: "Home".tr()),
          BottomNavigationBarItem(icon:  Icon(Icons.favorite_border,size: 24.h,
              ),
          label: "Favourites".tr(),
          ),
          BottomNavigationBarItem(icon:  CircleAvatar(
              backgroundColor: currentindex==2?
              AppColor.customred:Colors.white,radius: currentindex==
              2?20.r:15.r,child: Icon(Icons.shopping_cart,size: 24.h,
            color:currentindex==2? Colors.white:Colors.black,)),
              label: "Cart".tr(),backgroundColor: Colors.white),
          BottomNavigationBarItem(icon: Icon(Icons.settings,size
              : 24.h,),label: "Settings".tr()),
        ],
        ),
      ),
      body: screens[currentindex],
    );
  }
}
