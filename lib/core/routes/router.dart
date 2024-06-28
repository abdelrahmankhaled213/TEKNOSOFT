import 'package:ecommerce_app/core/injection/injectionservice.dart';
import 'package:ecommerce_app/features/BottomNavigationBar/bottomNavigation.dart';
import 'package:ecommerce_app/features/Cart/Data/Repo/AddressRepo.dart';
import 'package:ecommerce_app/features/Cart/Data/Repo/Cartrepo.dart';
import 'package:ecommerce_app/features/Cart/presentation/model_view/Cubit/cartcubit.dart';
import 'package:ecommerce_app/features/Cart/presentation/views/OrderSuccess.dart';
import 'package:ecommerce_app/features/Category/data/Repo/CategoryRepo.dart';
import 'package:ecommerce_app/features/Category/presentation/Views/CategoryScreenView.dart';
import 'package:ecommerce_app/features/Category/presentation/model_view/category_bloc.dart';
import 'package:ecommerce_app/features/Home/presentation/Ui/homescreenview.dart';
import 'package:ecommerce_app/features/Login/presentation/UI/Forgot%20Password.dart';
import 'package:ecommerce_app/features/Login/presentation/UI/LoginView.dart';
import 'package:ecommerce_app/features/Login/presentation/model_view/cubit.dart';
import 'package:ecommerce_app/features/Settings/UserModel/usermodel.dart';
import 'package:ecommerce_app/features/Settings/views/UserProfileDetails.dart';
import 'package:ecommerce_app/features/SignUp/presentation/Model_View/cubit.dart';
import 'package:ecommerce_app/features/SignUp/presentation/Ui/SignUpView.dart';
import 'package:ecommerce_app/features/SplashScreen/SplashScreen.dart';
import 'package:ecommerce_app/features/onBoardingScreen/Presentation/Ui/OnBoardingView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final  GoRouter gorouter=GoRouter(
    routes: [
    //   GoRoute(path: "/OrderScreenView",builder: (context, state) => BlocProvider(
    // create: (context) => OrderCubit(),child: OrderScreenView(order: state.extra as List<OrderModel>,))),
      GoRoute(path: "/",builder: (context, state) => SplashScreen(),),
      GoRoute(path: "/OrderSplashScreen"
        ,builder: (context, state) => BlocProvider(create: (context) {
        return CartCubit(cartServices: getitinstance<CartRepo>(), addressServices:getitinstance<AddressRepo>() );
      },child: OrderSplashScreen()),),
      GoRoute(path: "/UserScreenView",builder: (context, state) =>UserScreenView(
        user: state.extra as UserModel,
      )

        ,),
      GoRoute(path: "/OnBoardingView",builder: (context, state) => OnBoardingView(),),

      GoRoute(path: "/OnBoardingView",builder: (context, state) => OnBoardingView(),),
      GoRoute(path: "/HomeScreenView",builder: (context, state) => HomeScreenView(),),
      GoRoute(path: "/SignUpView",builder: (context, state) =>
          BlocProvider(create:(context) => SignUpCubit() ,child: SignUpView()),),
      GoRoute(path: "/BottomNavigationView",builder: (context, state) => BottomNavigationBarView(),),
      GoRoute(path: "/LoginView",builder: (context, state) =>
          BlocProvider(create: (context) => LoginCubit(),child: LoginScreenView()),),
          GoRoute(path: "/ForgotPasswordView",builder: (context, state) =>
              BlocProvider(create: (context)
          => LoginCubit(),child:  ForgotPassword()),),
      GoRoute(path: "/CategoryScreenview/:index",builder: (context, state) => BlocProvider(create: (context) => CategoryCubit(services: getitinstance<CategoryRepo>()),child: CategoryScreenView(
        index: int.parse(state.pathParameters['index']!),
      )),)
],
initialLocation: "/",);
void goPush(String location,BuildContext context ,{Object? object}){
  GoRouter.of(context).push(location,extra: object??null);
}
void goPushReplacement(String location,BuildContext context){
  GoRouter.of(context).pushReplacement(location);
}