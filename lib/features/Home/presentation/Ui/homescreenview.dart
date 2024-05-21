import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';
import 'package:ecommerce_app/features/Home/presentation/model_view/home_cubit.dart';
import 'package:ecommerce_app/features/Home/presentation/model_view/home_state.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/BuidCustomAppBar.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/BuildList.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/CustomGridView.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/CustomSlideShow.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeScreenView extends StatefulWidget {
  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
   List<HomeData> data=[];
   getData()async{
     data=await BlocProvider.of<HomeCubit>(context).getHomeData(context);
   }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: RefreshIndicator(
        color: AppColor.main,
        onRefresh: () async{
          await getData();
        },
        child: SafeArea(
          child: Padding(
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
                  child: Text(S.of(context).AllFeatured,style: Styles.Montserratgrey16w300.copyWith(
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
                    child: Text(S.of(context).Sales,style: Styles.Montserratgrey16w300.copyWith(
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
                    BlocConsumer<HomeCubit,HomeState>(
                      listener: (context, state) {
                        // if (state is HomeLoadingState) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //        SnackBar(
                        //           backgroundColor: Theme.of(context).colorScheme.brightness==Brightness.dark?Colors.white:Colors.black, content: Text(
                        //           "loading")));
                        // }
                        if (state is HomeLoadedState) {

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor:  Theme.of(context).colorScheme.brightness==Brightness.dark?Colors.white:Colors.black, content: Text(data.length.toString())));
                        }
                        if (state is HomeFaliureState) {
                          print(data.length);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Theme.of(context).colorScheme.brightness==Brightness.dark?Colors.white:Colors.black, content: Text(state
                              .msg)));
                        }
                      },
                      builder: (context, state) =>
                      CustomGridView(
                        data: data,
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}