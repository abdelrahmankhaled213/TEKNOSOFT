import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:to_dolist_app/Core/Theme/styles.dart';

class CustomContent extends StatelessWidget {
  const CustomContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Row(
              children: [
                Icon(Icons.sunny, size: 30.h, color: Colors.blueGrey),
                SizedBox(width: 100.w,),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push('/UpComing');
                  },
                    child:   Text("UpComing", style: Styles.LibreCaslonw600),

                  ),
              ],
            ),
            Divider(thickness: 2.h,color: Colors.blueGrey,),
            Row(
                children: [
                  Icon(Icons.calendar_month, size: 30.h, color: Colors.blueGrey),
                  SizedBox(width: 120.w,),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push('/Today');
                    },
                    child: Text("Today", style: Styles.LibreCaslonw600)
                    ),
                ]
            ),
          ],
        )
      ],
    );
  }
}