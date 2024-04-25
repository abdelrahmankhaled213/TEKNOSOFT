import 'package:bmiapp/core/theming/styles.dart';
import 'package:bmiapp/core/widgets/customButton.dart';
import 'package:bmiapp/features/HomeScreen/widgets/Ageorweight.dart';
import 'package:bmiapp/features/HomeScreen/widgets/customrow.dart';
import 'package:bmiapp/features/HomeScreen/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
class HomeScreenView extends StatelessWidget {
  var state=true.obs;
 late  double bmiresult;
  var sliderresult=0.0.obs;
  var numbers=<int>[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
  ];
  var weightselected=0.obs;
  var numberofaddorremove=1.obs;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
      AppBar(
        title: Text("BMI Calculator",style: Styles.Montserratw500.copyWith(
          fontWeight: FontWeight.bold
        )),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
              ),
            ),
           SliverToBoxAdapter(
             child: Center(child: Text("Gender",style: Styles.Montserratw500.copyWith(
               fontWeight: FontWeight.bold,
             ),)),
           ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 5.h,
              ),
            ),
           SliverToBoxAdapter(
               child:
               CustomRow(
                state: state,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 15.h,
              ),
            ),
            SliverToBoxAdapter(
              child:
             Align(alignment:
             Alignment.center,
                 child: Text("Height",
                   style: Styles.Montserratw500.copyWith
                     ( fontWeight: FontWeight.bold),
                 )
             )
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30.h,
              ),
            ),
            SliverToBoxAdapter(
              child:
                CustomSlider(
                  result: sliderresult,
                    onchanged: (p0) {
                    sliderresult.value=p0;
                    },
                )
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 50.h,
              ),
            ),
            SliverToBoxAdapter(
                child:
             AgeOrWeight(

               ontapremove: () {

                 if(numberofaddorremove.value>1)
                 numberofaddorremove.value--;
                 else{
                   ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(content: Text("Couldn\'t do that ",style: const
                       TextStyle(color: Colors.white),)
                       )
                   );
                 }
               },
               ontapadd: () {
                 numberofaddorremove.value++;
               },
               addorremove: numberofaddorremove,
               numbers: numbers,
               selected: (p0) {
                 weightselected.value=numbers[p0];

               },
             )
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 50.h,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomButtonCore(
                text: 'go',
                ontouch: () async{
                  if(weightselected.value==0){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select weight",style: const
                        TextStyle(color: Colors.white),)
                        )

                    );
                    return;
                  }
                  if(sliderresult.value==0){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select height",style: const
                        TextStyle(color: Colors.white),)
                        )
                    );
                    return;
                  }
bmiresult=(weightselected.value)/((sliderresult.value/100)*(sliderresult.value/100));

  GoRouter.of(context).push(
    '/bmiresult/ '
        '${bmiresult.toStringAsFixed(1)} '
        '/${determineWeight(bmiresult)}/${state.value}/$numberofaddorremove/${weightselected.value}/ ${sliderresult.value} ',

  );
                  weightselected.value=0;
                  numberofaddorremove.value=1;
                  sliderresult.value=0.0;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
String determineWeight(double result){
  var weight="";
  if(result<18.5)
    weight="UnderWeight";

  else if(18.5<=result&&result<25)
    weight="Normalweight";
  else if(25<=result&&result<30)
    weight="Overweight";
  else{
    weight="Obese";
  }
  return weight;
}