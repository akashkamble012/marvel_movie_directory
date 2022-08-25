import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_movie_directory/core/app_colors.dart';
import 'package:marvel_movie_directory/core/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonName;
  final double borderRadius;
  final Color color;
  final Color textColor;
  final Size size;

  const CustomElevatedButton({
    Key? key,
    this.onPressed,
    this.color = AppColor.secondary,
    this.textColor = AppColor.white,
    required this.buttonName,
    this.borderRadius = 0,
    this.size = const Size(250.0, 40.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(size),
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: Styles.borderRadiusCircular12,
          ),
        ),
      ),
      child: Text(
        buttonName,
        style:  TextStyle(
            fontWeight: FontWeight.bold, color: textColor, fontSize: 16.sp),
      ),
    );
  }
}
