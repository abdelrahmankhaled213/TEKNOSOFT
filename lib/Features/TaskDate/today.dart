import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_dolist_app/Core/DataBaseHelper/databaseservices.dart';
import 'package:to_dolist_app/Core/Theme/styles.dart';
import 'package:to_dolist_app/Features/HomeScreen/Data/model/getTasksData.dart';
import 'package:to_dolist_app/Features/HomeScreen/Presentation/widgets/CustomContainer.dart';
import 'package:to_dolist_app/Features/TaskDate/logic.dart';
class Today extends StatefulWidget {
  @override
  State<Today> createState() => _Today();
}
class _Today extends State<Today> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Task>>(
          builder:
              (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueGrey,
                    backgroundColor: Colors.white,
                  )
              );
            }
            if (snapshot.data!.length == 0)
              return SafeArea(child: Center(child: Text(
                " No Task Today", style: Styles.LibreCaslonw600,)));
            if (snapshot.hasData)
              return SafeArea(
                child:
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(
                              height: 5.h,
                            ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          return CustomContainer(height: 150.h, width: 220.w,
                              color: categColors(i, snapshot)!.color1, color2: categColors(i, snapshot)!.color2, child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Task content: "+snapshot.data![i].title!,
                                          style: Styles.LibreCaslonw600.copyWith(fontSize: 12.sp,
                                              color: Colors.white),),
                                        Text("Task Date: "+snapshot.data![i].date!,style: Styles.LibreCaslonw600.copyWith(fontSize: 12.sp,color: Colors.white),),
                                      ],
                                    ),
                                    Text("Task Category:"+snapshot.data![i].category.toString(),  style: Styles.LibreCaslonw600.copyWith(fontSize: 12.sp,
                                        color: Colors.white) ,)
                                  ]));
                        }
                    ),
                  ),
                ),
              );



            return SizedBox();
          },

          future: DataBaseHelper.getAllDataToday(DateTime.now()),
        )
    );
  }
}
