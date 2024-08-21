import 'dart:ui';

import 'package:aims_coding_task/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundBlurEffect extends StatelessWidget {
  const BackgroundBlurEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: R.colors.secondary,
          width: 1.sw,
          height: 1.sh,
        ),

        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  R.colors.primary,
                  Colors.transparent,
                ],
                radius: 1,
                stops: const [0, 0.7],
                center: Alignment.center,
              ),
            ),
          ),
        ),

        // Blur effect
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 55.0, sigmaY: 50.0),
            child: Container(
              color: R.colors.secondary.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }
}
