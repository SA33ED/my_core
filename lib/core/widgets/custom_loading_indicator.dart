import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
    this.height,
  });
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 150.h,
      // child: Lottie.asset(Assets.assetsImagesAnimLoadingg),
    );
  }
}
