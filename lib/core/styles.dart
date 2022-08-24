import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class Styles {
  static const double otpFieldWidth = 45.0;
  static const double otpFieldHeight = 60.0;
  static const sizedBox = SizedBox();
  static final sizedBoxH04 = SizedBox(height: 4.h);
  static final sizedBoxW04 = SizedBox(width: 4.w);

  static final sizedBoxH08 = SizedBox(height: 8.h);
  static final sizedBoxW08 = SizedBox(width: 8.w);

  static final sizedBoxH10 = SizedBox(height: 10.h);
  static final sizedBoxW10 = SizedBox(width: 10.w);

  static final sizedBoxH15 = SizedBox(height: 15.h);
  static final sizedBoxW15 = SizedBox(width: 15.w);

  static final sizedBoxH20 = SizedBox(height: 20.h);
  static final sizedBoxW20 = SizedBox(width: 20.w);

  static final sliverToBoxAdapSH10 = SliverToBoxAdapter(child: sizedBoxH10);

  static const spacer = Spacer();

  static const divider = Divider();
  static final dividerTH2 = Divider(thickness: 2.sp);

  static final sliverToBoxAdapterH10 =
      SliverToBoxAdapter(child: Styles.sizedBoxH10);
  static final sliverToBoxAdapterH20 =
      SliverToBoxAdapter(child: Styles.sizedBoxH20);

  static SizedBox sizeBoxH({required double height}) {
    return SizedBox(height: height.h);
  }

  static SizedBox sizeBoxW({required double width}) {
    return SizedBox(width: width.w);
  }

  //

  static const edgeInsetsZero = EdgeInsets.zero;
  static final edgeInsetsAll04 =
      EdgeInsets.symmetric(horizontal: 04.w, vertical: 04.h);
  static final edgeInsetsAll08 =
      EdgeInsets.symmetric(horizontal: 08.w, vertical: 08.h);
  static final edgeInsetsAll10 =
      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h);
  static final edgeInsetsAll15 =
      EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h);
  static final edgeInsetsAll20 =
      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h);
  static final edgeInsetsAll30 =
      EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h);

  static final edgeInsetsOnlyH04 = EdgeInsets.symmetric(vertical: 04.h);
  static final edgeInsetsOnlyH06 = EdgeInsets.symmetric(vertical: 06.h);
  static final edgeInsetsOnlyH08 = EdgeInsets.symmetric(vertical: 08.h);
  static final edgeInsetsOnlyH10 = EdgeInsets.symmetric(vertical: 10.h);
  static final edgeInsetsOnlyH15 = EdgeInsets.symmetric(vertical: 15.h);
  static final edgeInsetsOnlyH20 = EdgeInsets.symmetric(vertical: 20.h);

  static final edgeInsetsOnlyW04 = EdgeInsets.symmetric(horizontal: 04.w);
  static final edgeInsetsOnlyW06 = EdgeInsets.symmetric(horizontal: 06.w);
  static final edgeInsetsOnlyW08 = EdgeInsets.symmetric(horizontal: 08.w);
  static final edgeInsetsOnlyW10 = EdgeInsets.symmetric(horizontal: 10.w);
  static final edgeInsetsOnlyW15 = EdgeInsets.symmetric(horizontal: 15.w);
  static final edgeInsetsOnlyW20 = EdgeInsets.symmetric(horizontal: 20.w);

  static final borderRadiusCircular04 = BorderRadius.circular(04.r);
  static final borderRadiusCircular08 = BorderRadius.circular(08.r);
  static final borderRadiusCircular12 = BorderRadius.circular(12.r);
  static final radiusCircular04 = Radius.circular(04.r);
  static final radiusCircular08 = Radius.circular(08.r);
  static final radiusCircular12 = Radius.circular(12.r);

  static TextStyle headingFont1 = GoogleFonts.poppins(
      textStyle: TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 34.sp,
    color: AppColor.white,
  ));

  static const subHeadingFont =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle headingFont2 = GoogleFonts.poppins(
      textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          letterSpacing: 0.9,
          color: AppColor.white // AppColor.grey700,
          ));

  static TextStyle bodyFont = GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.white // AppColor.grey700,
          ));
  static TextStyle bodyFont2 = GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.white // AppColor.grey700,
          ));

  static TextStyle buttonTextStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColor.white // AppColor.grey700,
          ));

  static TextStyle appbarTitleFont = GoogleFonts.poppins(
      textStyle: TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.secondary,
  ));

  static TextStyle dashboardTitleFont = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 16.sp, color: Colors.black);
}
