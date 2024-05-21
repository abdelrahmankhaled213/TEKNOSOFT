import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:to_dolist_app/Core/DataBaseHelper/databaseservices.dart';
import 'package:to_dolist_app/Core/Theme/styles.dart';
import 'package:to_dolist_app/Features/HomeScreen/Data/model/getTasksData.dart';
import 'package:to_dolist_app/Features/HomeScreen/Presentation/widgets/CustomContainer.dart';
import 'package:to_dolist_app/Features/TaskDate/logic.dart';

class UpComing extends StatefulWidget {
  @override
  State<UpComing> createState() => _UpComingState();
}

class _UpComingState extends State<UpComing> {
  var datechosen = DateFormat('yMMMd').format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
              // if (snapshot.data!.length == 0)
              //   return SafeArea(child: Center(child: Text(
              //     " No Upcoming Task ", style: Styles.LibreCaslonw600,)));

              if (snapshot.hasData) {
                return SafeArea(
                  child:Column(
                  children: [
                      Column(
                      children: [
                        SizedBox(
                          height: 70.h,
                          child: DatePicker(
                            DateTime.now(),
                            initialSelectedDate: DateTime.now(),
                            selectionColor: Colors.blueGrey,
                            selectedTextColor: Colors.white,
                            onDateChange: (date) {
                              // New date selected
                          datechosen=DateFormat('yMMMd').format(date);
setState(() {

});
                            },
                          ),
                        ),
                        SizedBox (
                          height: 15.h,
                        ) ,
                      SizedBox(
                        height: 500.h,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child:
                          ListView.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, i) {
                                  return CustomContainer(height: 150.h, width: 220.w,
                                      color: categColors(i, snapshot)!.color1,
                                      color2: categColors(i, snapshot)!.color2, child:  Row(
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
                                          ]
                                      )
                                  );
                                }
                            ),
                          ),
                        ),

                      ],
                    ),

                  ]
                    ,
                  ),
                );
              }
              return const SizedBox();
            },
            future: DataBaseHelper.getAllDataUpcoming(datechosen.toString()),
          )
      );
    }
}