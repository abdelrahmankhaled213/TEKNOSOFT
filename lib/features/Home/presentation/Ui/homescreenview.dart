import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/core/networking/Networking_Bloc.dart';
import 'package:ecommerce_app/core/networking/Networking_State.dart';
import 'package:ecommerce_app/core/networking/networking_event.dart';
import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';
import 'package:ecommerce_app/features/Home/presentation/model_view/home_cubit.dart';
import 'package:ecommerce_app/features/Home/presentation/model_view/home_state.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/BuidCustomAppBar.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/BuildList.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/CustomGridView.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/CustomSlideShow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeScreenView extends StatefulWidget {
  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}
class _HomeScreenViewState extends State<HomeScreenView> {
  StreamSubscription?streamSubscription;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    streamSubscription=Connectivity().onConnectivityChanged.listen((event) {
      if(event[0]==ConnectivityResult.wifi||event[0]==ConnectivityResult.mobile){
    context.read<NetworkingBloc>().add(OnlineEvent());
      }
      else{
        context.read<NetworkingBloc>().add(OfflineEvent());
      }
    });
  }
   List<HomeData> data=[];
   getData()async{
     data=await BlocProvider.of<HomeCubit>(context).getHomeData(context);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        SafeArea(
          child: BlocListener<NetworkingBloc, NetworkingState>(
            listener: (context, state) {
            if(state is OnlineState){
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(elevation: 12.sp,
            backgroundColor: AppColor.customblue,
           content:Text("Connected".tr()
              ,style: Styles.Montserratgrey16w300.copyWith(
                color: AppColor.offWhite
              ),)));
            }
           if(state is OfflineState){
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(elevation: 12.sp,
                 backgroundColor: AppColor.customblue,
                  content:Text("No Internet Connection".tr()
                   ,style: Styles.Montserratgrey16w300.copyWith(
                       color: AppColor.offWhite
                   ),)));
           }

          },
            child:
               BlocBuilder<NetworkingBloc, NetworkingState>(
  builder: (context, state) {
  return  state is  OnlineState?
  Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: CustomScrollView(
          // shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
              child: BuildCustomAppBar(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
              ),
            ),
            SliverToBoxAdapter(
                child: Text("AllFeatured".tr(),style: Styles.Montserratgrey16w300.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color:  Theme.of(context).colorScheme.brightness==Brightness.dark?Colors.white:AppColor.customPurple
                ),)
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
              child: BuildListViewCircleAvaters(
              ),
            ),
            SliverToBoxAdapter(
              child: CustomSlideShow(
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 12.h,
              ),
            ),
            SliverToBoxAdapter(
                child: Text("sale".tr(),style: Styles.Montserratgrey16w300.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color:  Theme.of(context).colorScheme.brightness==Brightness.dark?Colors.white:Colors.black
                ),)
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
                child:
                BlocBuilder<HomeCubit,HomeState>(
                    builder: (context, state) =>
                        CustomGridView(
                          data: data,
                        )
                )
            )
          ],
        )
    ):
    Center(
        child: Image.asset(
        "assets/Images/Animation - 1715076571938.gif",
        height: 250.h,
        fit: BoxFit.cover,
    )
    );
    },
)

               )
          ),
        );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    streamSubscription?.cancel();
    super.dispose();
  }
}

