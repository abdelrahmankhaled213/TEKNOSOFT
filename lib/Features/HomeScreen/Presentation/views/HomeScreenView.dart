import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_dolist_app/Core/Theme/styles.dart';
import 'package:to_dolist_app/Features/HomeScreen/Presentation/widgets/CustomContent.dart';
import 'package:to_dolist_app/Features/HomeScreen/Presentation/widgets/CustomGridView.dart';


class HomeScreenView extends StatefulWidget {
  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
  SafeArea(
    child:  Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Text("To Do List", style: Styles.LibreCaslonw600),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 100.h,
              width: 200.w,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(20.r),
  boxShadow: [
    BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 4.r)],
),
              child:  const CustomContent(),
            )
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30.h,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomGridView(),
          )
      ]
      ),
    ),
  )
    );
}
}