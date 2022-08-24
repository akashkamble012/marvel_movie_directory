import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_movie_directory/core/app_colors.dart';

class InputBoxFill extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final String labelText;
  final IconData? icon;
  final double? fontSize;

  final Widget? suffix;
  final bool obscureText;
  final bool enable;
  final String? initialValue;
  final int? maxLength;
  final int? maxLines;
  final double? labelFontSize;
  final double? errorFontSize;
  final bool contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final double borderRadius;
  final Function(String)? onChange;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;

  const InputBoxFill({
    Key? key,
    this.hintText,
    this.errorText,
    required this.labelText,
    this.icon,
    this.borderRadius = 0,
    this.obscureText = false,
    this.fontSize,
    this.contentPadding = true,
    this.suffix,
    this.enable = true,
    this.initialValue,
    this.controller,
    this.labelFontSize,
    this.errorFontSize,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatters,
    this.textInputAction,
    this.keyboardType,
    this.focusNode,
    this.onChange,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.secondary,
      maxLength: maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColor.white,
        fontSize: labelFontSize,
      ),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        suffixIcon: suffix,
        errorText: errorText,
        errorStyle: TextStyle(fontSize: errorFontSize),
        focusColor: AppColor.primaryLight,
        fillColor: AppColor.primary,
        filled: true,
        enabled: enable,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          borderSide: const BorderSide(color: AppColor.primaryDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          borderSide: const BorderSide(color: AppColor.white),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            borderSide: const BorderSide(color: AppColor.secondary)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            borderSide: const BorderSide(color: AppColor.alertColor)),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColor.white,
          fontSize: labelFontSize,
        ),
        hintText: labelText,
      ),
      inputFormatters: inputFormatters ??
          [
            FilteringTextInputFormatter.deny(RegExp(r'[ ]')),
          ],
      maxLines: maxLines,
      initialValue: initialValue,
      controller: controller,
      obscureText: obscureText,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChange,
      onSaved: onSaved,
      validator: validator,
    );
  }
}
