import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class CustomTextRich extends StatelessWidget {
String text;
TextStyle textstyle1;
String text2;
TextStyle textstyle2;
void Function() ontap;
CustomTextRich({
  required this.text,
  required this.textstyle1,
  required this.textstyle2,
  required this.text2,
  required this.ontap
});
  @override
  Widget build(BuildContext context) {
    return
      Text.rich(
        TextSpan(

      children: [
        TextSpan(
            text: text,
            style: textstyle1

        ),
        TextSpan(
            text: text2,
          style: textstyle2,
          recognizer: TapGestureRecognizer()..onTap=ontap
          )
      ]
          )
          )
    ;
  }
}

