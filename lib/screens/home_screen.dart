import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_movie_directory/common/widgets/buttons/custom_elevated_button.dart';
import 'package:marvel_movie_directory/controller/auth_controller.dart';
import 'package:provider/provider.dart';

import '../controller/loading_provider.dart';
import '../controller/movie_controller.dart';
import '../core/app_colors.dart';
import '../core/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'When is the next Marvel Comic Universe film?',
            textAlign: TextAlign.center,
            style: Styles.headingFont1,
          ),
          Styles.sizedBoxH20,
          CustomElevatedButton(
            buttonName: 'Choose date to find out',
            onPressed: () =>
                Provider.of<MovieController>(context, listen: false)
                    .selectTimeAndDisplayMovie(context),
            size: Size(300.w, 40.h),
          ),
          Styles.sizedBoxH20,
          Styles.sizedBoxH20,
          GestureDetector(
            onTap: () async {
              Provider.of<LoadingProvider>(context, listen: false)
                  .setLoad(true);
              await Provider.of<AuthController>(context, listen: false)
                  .signOut(context);
              Provider.of<LoadingProvider>(context, listen: false)
                  .setLoad(false);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  size: 30.w,
                  color: AppColor.white,
                ),
                Text(
                  'Sign Out',
                  style: Styles.bodyFont2,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
