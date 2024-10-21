import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_torismDemo/generated/assets.dart';

class AuthBackground extends StatelessWidget {
  AuthBackground({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.imagesLoginBackground,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 250.r,
          width: 370.w,
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
