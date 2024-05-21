import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/features/onBoardingScreen/Presentation/functions/fun.dart';
import 'package:ecommerce_app/features/onBoardingScreen/Presentation/model_view/OnBoardingChange.dart';
import 'package:ecommerce_app/features/onBoardingScreen/Presentation/widgets/NumberAndSkip.dart';
import 'package:ecommerce_app/features/onBoardingScreen/Presentation/widgets/buildRow.dart';
import 'package:ecommerce_app/features/onBoardingScreen/Presentation/widgets/onBoardingColumnWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
class OnBoardingView extends StatefulWidget {
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}
class _OnBoardingViewState extends State<OnBoardingView> {
   PageController pageController=PageController();
  var text="Next";
  int index1=0;
  var state=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
        children: [
CustomRow(
  currentindex:index1+1,
),
          SizedBox(
            height: MediaQuery.of(context).size.height/15,
          ),
          SizedBox(
            height:400.h,
            width: MediaQuery.of(context).size.width,
            child:
            PageView.builder(
                itemCount: onboardingchange.length,
                controller: pageController,
                onPageChanged: (indexxx){
                  index1=indexxx;
                  setState(() {
                    state=checkState(state, index1);
                    text=checkText(index1, text);

                  });
                },
                itemBuilder: (context, index) {
                  return OnBoardingColumn(
                    index: index1,
                  );
                }
            )
          ),
          Padding(
            padding:
            EdgeInsets.symmetric(
                horizontal:
          10.w
            ),
            child:
            Column(

              children: [

               SizedBox(
height:80.h,
          width: 340.w,
                 child: Text(
                   textAlign: TextAlign.center," Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit"
                 ,style: Styles.Montserratgrey16w300,
                               ),
               ),
                SizedBox(
                  height: 60.h,
                ),
                buildRow(
                  pagecont: pageController,
                  next: (){
                    if(index1!=2)
                    pageController.nextPage(duration:
                    const Duration(microseconds: 100), curve: Curves.bounceIn);
                 else {
                      GoRouter.of(context).push("/SignUpView");
                    }
                  },
                    prev: (){
                 pageController.previousPage( duration: const Duration(microseconds: 100), curve: Curves.bounceIn);
                    },
                  text: text,
                  state: state
                )
              ]
            ),
          ),
        ]
        ),
      ),
    );
  }
}
