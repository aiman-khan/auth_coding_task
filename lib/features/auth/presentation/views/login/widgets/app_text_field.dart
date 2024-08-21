import 'package:aims_coding_task/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    required this.controller,
    required this.focusNode,
    required this.prefixIcon,
    required this.hintText,
    this.onEditingComplete,
    this.validator,
    this.obscureText = false,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final Widget prefixIcon;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: R.colors.white,
      controller: controller,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      validator: validator,
      obscureText: obscureText,
      style: TextStyle(
        fontSize: 14.sp,
        color: R.colors.white,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: R.colors.white,
        ),
        prefixIcon: prefixIcon,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: R.colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: R.colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: R.colors.white),
        ),
      ),
    );
  }
}
