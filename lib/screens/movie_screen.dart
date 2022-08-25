import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:marvel_movie_directory/common/widgets/body_wrapper.dart';
import 'package:marvel_movie_directory/common/widgets/buttons/custom_elevated_button.dart';
import 'package:marvel_movie_directory/controller/movie_controller.dart';
import 'package:marvel_movie_directory/core/app_colors.dart';
import 'package:marvel_movie_directory/core/routes.dart';
import 'package:marvel_movie_directory/core/styles.dart';
import 'package:provider/provider.dart';

import '../model/upcoming_movie.dart';
import '../widgets/movie_card.dart';

class MovieScreen extends StatefulWidget {
  final UpcomingMovie upcomingMovie;
  final DateTime selectedDateTime;

  const MovieScreen(
      {Key? key, required this.upcomingMovie, required this.selectedDateTime})
      : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final DatePickerController datePickerController = DatePickerController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 30.w,
                    ))
              ],
            ),
          ),
          Expanded(
            child: BodyWrapper(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // DecoratedBox(
                  //   decoration: const BoxDecoration(color: AppColor.primary),
                  //   child: DatePicker(
                  //     widget.selectedDateTime,
                  //     height: 90.h,
                  //     dateTextStyle: Styles.bodyFont2,
                  //     dayTextStyle: Styles.bodyFont2,
                  //     monthTextStyle: Styles.bodyFont2,
                  //     initialSelectedDate: widget.selectedDateTime,
                  //     selectionColor: AppColor.secondary,
                  //     selectedTextColor: Colors.white,
                  //     onDateChange: (date) {
                  //       Provider.of<MovieController>(context, listen: false)
                  //           .getUpComingMovieFromDatePickerTimeLine(context,
                  //               date: date);
                  //     },
                  //   ),
                  // ),
                  CustomElevatedButton(
                    buttonName: 'See what\'s on other dates',
                    color: AppColor.primary,
                    textColor: AppColor.white,
                    onPressed: () =>
                        Provider.of<MovieController>(context, listen: false)
                            .selectTimeAndDisplayMovie(context, pushReplace: true),
                    size: Size(300.w, 40.h),
                  ),
                  Styles.sizedBoxH20,
                  Align(
                    alignment: Alignment.center,
                    child: PosterWidget(
                      imageUrl: widget.upcomingMovie.posterUrl,
                    ),
                  ),
                  Styles.sizedBoxW20,
                  Styles.sizedBoxW10,
                  Text(
                    widget.upcomingMovie.title,
                    style: Styles.headingFont2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Releasing on:  ',
                        style: Styles.bodyFont,
                      ),
                      Text(
                        DateFormat('dd MMM yyyy')
                            .format(widget.upcomingMovie.releaseDate),
                        style:
                            Styles.bodyFont.copyWith(color: AppColor.secondary),
                      )
                    ],
                  ),
                  Styles.sizedBoxH20,
                  Text(
                    'About the movie',
                    style: Styles.headingFont2,
                  ),
                  Styles.sizedBoxH04,
                  Text(
                    widget.upcomingMovie.overview,
                    style: Styles.bodyFont2,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          widget.upcomingMovie.followingProduction == null
              ? Styles.sizedBox
              : CustomElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(movieScreen, arguments: {
                      'upcomingMovie': widget.upcomingMovie.followingProduction,
                      'selectedDateTime': widget.selectedDateTime
                    });
                  },
                  buttonName: 'Next Release',
                  size: Size(200.w, 40),
                ),
          Styles.sizedBoxH10,
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
