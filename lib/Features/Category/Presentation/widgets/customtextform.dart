import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_dolist_app/Core/Theme/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  late final IconButton? iconButton;
  late FocusNode? node;

  CustomTextFormField({required this.hint,required this.controller, this.iconButton, this.node});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.r),
      margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
      child: TextFormField(
        focusNode: node,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          hintText: hint,
          prefixIcon: iconButton,
          hintStyle: Styles.LibreCaslonw600.copyWith(color: Colors.blueGrey,fontSize:10.sp ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        controller: controller,
      ),
    );
  }
}
