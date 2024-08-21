import 'package:aims_coding_task/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isLoading;

  const AppFilledButton({
    required this.text,
    required this.onTap,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 184.w,
      height: 39.h,
      decoration: BoxDecoration(
        color: R.colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 2,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: Size(
            184.w,
            39.h,
          ),
          maximumSize: Size(
            184.w,
            39.h,
          ),
        ),
        onPressed: onTap,
        child: SizedBox(
          width: 278.w,
          height: 39.h,
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 20.r,
                    height: 20.r,
                    child: CircularProgressIndicator(
                      color: R.colors.primary,
                    ),
                  )
                : Text(
                    text,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: R.colors.secondary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
