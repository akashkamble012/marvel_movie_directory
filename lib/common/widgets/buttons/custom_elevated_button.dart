import 'package:flutter/material.dart';
import 'package:marvel_movie_directory/core/app_colors.dart';
import 'package:marvel_movie_directory/core/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonName;
  final double borderRadius;
  final Size size;

  const CustomElevatedButton({
    Key? key,
    this.onPressed,
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
        backgroundColor: MaterialStateProperty.all(AppColor.secondary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: Styles.borderRadiusCircular12,
          ),
        ),
      ),
      child: Text(
        buttonName,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
      ),
    );
  }
}
