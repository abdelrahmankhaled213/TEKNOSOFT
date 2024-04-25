import 'package:bmiapp/core/theming/styles.dart';
import 'package:bmiapp/features/HomeScreen/views/HomeScreenView.dart';
import 'package:bmiapp/features/HomeScreen/widgets/child_of_ageandweight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
class AgeOrWeight extends StatelessWidget{
  List<int>numbers;
  void Function(int)selected;
  void Function() ontapadd;
  void Function() ontapremove;
  Rx<int>addorremove;
  AgeOrWeight({
    required this.ontapremove,
    required this.ontapadd,
    required this.numbers,
    required this.selected,
    required this.addorremove
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text("Age",style: Styles.Montserratw500.copyWith( fontWeight: FontWeight.bold,fontSize: 16.sp),),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 60.h,
              width: 120.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                      color: Colors.black
                  )
              ),
              child: ChildOfAgeOrWeight(
                ontapadd: ontapadd,
                ontapremove: ontapremove,
                mynumber: addorremove,
              ),
            )
          ],
        ),
        Column(

          children: [
            Text("Weight",style: Styles.Montserratw500.copyWith( fontWeight: FontWeight.bold,fontSize: 16.sp),),
            SizedBox(
              height: 10.h,
            ),
            Container(
                height: 60.h,
                width: 120.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child:
                ListWheelScrollView
                    .useDelegate(
                    useMagnifier: true,
                    itemExtent: 42,
                    childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) =>Text(numbers[index].toString(),style: Styles.Montserratw500.copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold
                        ),) ,
                        childCount: numbers.length
                    ),onSelectedItemChanged: selected
                )
            )],
        ),
      ],
    );
  }

}