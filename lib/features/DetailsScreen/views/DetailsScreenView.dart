import 'package:bmiapp/core/routes/approuter.dart%20';
import 'package:bmiapp/core/theming/colors.dart';
import 'package:bmiapp/core/theming/styles.dart';
import 'package:bmiapp/core/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
class DetailsScreenView extends StatelessWidget {
  final double result;
  final bool state;
 final String Category ;
 final double weight;
 final double age;
 final double height;
  DetailsScreenView({required this.height,required this.age,required this.weight,required this.result,required this.Category,required this.state});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: () => Navigator.pop(context),child: Icon(Icons.arrow_back)),
        title: Text("Back",style: Styles.Montserratw500.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp
        ),
        ),
      ),
      body:   Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: CustomScrollView(
          slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 50.h,),)  ,
          SliverToBoxAdapter(
            child:   Center(
              child: Text("Result",style: Styles.Montserratw500.copyWith(
                  fontWeight: FontWeight.bold
                )),
            )
          ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h,),),
            SliverToBoxAdapter(
              child: Container(
                height: 60.h,
               margin: EdgeInsets.only(right: 130.w,left: 130.w),
                decoration: BoxDecoration(
                   color: AppColors.main,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Center(
                  child: Text("${result.toStringAsFixed(1)}"
                      ,style: Styles.Montserratw500.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                ),
              )
            ),
            SliverToBoxAdapter(child: SizedBox(height: 5.h,),),
            SliverToBoxAdapter(
                child: Center(child: Text("($Category)",style: Styles.Montserratw500
                )
                )
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.h,),),
          SliverToBoxAdapter( 
            child:
            Container(
              padding: EdgeInsets.all(5.sp),
            margin:   EdgeInsets.only(right: 50.w,left: 50.w),
            height: 70.h,
              decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.black),
          ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(state?Icons.man:Icons.woman,color:Colors.black,size: 30.sp,),
                    SizedBox(height: 3.h,),
                    Text(state?"Male":"Female",
                      style: Styles.Montserratw500
                          .copyWith( fontWeight: FontWeight.bold,fontSize: 10.sp)
                      ,),
                  ],
                ),
                Column(
                  children: [
                    Text("${age.toInt()}",
                      style: Styles.Montserratw500
                          .copyWith( fontWeight: FontWeight.bold,fontSize: 20.sp)
                      ,),
                    SizedBox(height: 5.h,),
                    Text("Age",style: Styles.Montserratw500
                        .copyWith( fontWeight: FontWeight.bold,fontSize: 10.sp)
                    ),

                  ],
                ),
                Column(
                  children: [
                    Text("${weight.toInt()}",
                      style: Styles.Montserratw500
                          .copyWith( fontWeight: FontWeight.bold,fontSize: 20.sp)
                      ,),
                    SizedBox(height: 5.h,),
                    Text("Weight",style: Styles.Montserratw500
                        .copyWith( fontWeight: FontWeight.bold,fontSize: 10.sp)
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("${height.toInt()}",
                      style: Styles.Montserratw500
                          .copyWith( fontWeight: FontWeight.bold,fontSize: 20.sp)
                      ,),
                    SizedBox(height: 5.h,),
                    Text("Height",style: Styles.Montserratw500
                        .copyWith( fontWeight: FontWeight.bold,fontSize: 10.sp)
                    ),
                  ],
                ),

              ],
            ),
          ),
          ),
            SliverToBoxAdapter(child: SizedBox(height: 40.h,),),
            SliverToBoxAdapter(
               child: Container(
                  height: 150.h,
                 padding: EdgeInsets.all(10.sp),
                 margin:   EdgeInsets.only(right: 50.w,left: 50.w),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(25.r),
                   border: Border.all(color: AppColors.main),
                 ),
                 child: Text.rich(
                   TextSpan(
                     children: [
                       TextSpan(text: "A BMI of ",style: Styles.Montserratw500
                           .copyWith( fontWeight: FontWeight.bold,fontSize: 10.sp)
                       ),
                       TextSpan(
                           text:"${determineRange(Category)} ",
                           style: Styles.Montserratw500.copyWith( color: AppColors.main,fontWeight: FontWeight.bold,fontSize: 10.sp)
                 ),
                       TextSpan(text: "indicates that you weight is the ",style: Styles.Montserratw500
                           .copyWith( fontWeight: FontWeight.bold,fontSize: 10.sp)
                       ),
                       TextSpan(
                           text:Category,
                           style: Styles.Montserratw500.copyWith( color: AppColors.main,fontWeight: FontWeight.bold,fontSize: 10.sp)
                       ),
                       TextSpan(text: " Category  for a person of your height \n \n Maintaining a healthy weight reduce the risk of diseases assoiciated with overweight and obesity ",style: Styles.Montserratw500
                           .copyWith( fontWeight: FontWeight.bold,fontSize: 10.sp)
                       ),

            ]
                   )

               )
            )
    ),
            SliverToBoxAdapter(child: SizedBox(height: 60.h,),),
            SliverToBoxAdapter(
              child: Container(
                height: 50.h,

                margin: EdgeInsets.symmetric(horizontal: 30.w),
                child: ElevatedButton.icon(
                  onPressed: (){
                    GoRouter.of(context).pop();
                  }, icon: Icon(Icons.repeat,color: Colors.white,)
                  , label: Text("calculate again",style: Styles.Montserratw500.copyWith(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold
                ),),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.main,
                      elevation: 12.sp,
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5.r),),
                  ),
                  ),
              )
            )
    ],
            ),
      )
    );
  }
}
String determineRange(String result) {
  if(result=="Underweight")
    return "less than 18.5";
  else if(result=="Normalweight")
    return "18.5-24.9";
  else if(result=="Overweight")
    return "25-29.9";
  else
    return "30 or more";
}

