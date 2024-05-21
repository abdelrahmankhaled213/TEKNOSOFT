import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:flutter/material.dart';
class EditTextFromField extends StatelessWidget {
  TextEditingController controller;
  String lablelText;
  bool? obscureText;
  IconButton? suffixIcon;

  EditTextFromField({this.suffixIcon,this.obscureText,required this.lablelText,required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText??false,
     controller: controller,
      decoration: InputDecoration(
        labelText: lablelText,
    suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: AppColor.customPurple),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: AppColor.customPurple),
        ),
      ),
    );
  }
}

