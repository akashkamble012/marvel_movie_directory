import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_movie_directory/common/utils/date_time_utils.dart';
import 'package:marvel_movie_directory/controller/loading_provider.dart';
import 'package:marvel_movie_directory/core/app_colors.dart';
import 'package:marvel_movie_directory/core/routes.dart';
import 'package:marvel_movie_directory/model/upcoming_movie.dart';
import 'package:provider/provider.dart';

import '../common/custom_alert.dart';

class MovieController with ChangeNotifier {
  late UpcomingMovie _upcomingMovie;

  UpcomingMovie get upcomingMovie => _upcomingMovie;

  void selectTimeAndDisplayMovie(context) async {
    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025, 7, 25),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColor.primary,
              onPrimary: AppColor.white,
              onSurface: AppColor.primaryDark,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: AppColor.secondary, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (dateTime == null) {
      return;
    }

    getUpcomingMovie(context, date: dateTime);
  }

  Future<void> getUpcomingMovie(context,
      {required DateTime date, bool pushReplace = false}) async {
    Provider.of<LoadingProvider>(context, listen: false).setLoad(true);
    try {
      final formattedDateTime = DateTimeUtils.formatDate(date);
      if (kDebugMode) {
        print('formatted date : $formattedDateTime');
      }
      final url = Uri.parse(
          'https://www.whenisthenextmcufilm.com/api?date=$formattedDateTime');
      final response = await http.get(url);
      final statusCode = response.statusCode;
      final extractedBody = json.decode(response.body);
      if (statusCode >= 400) {
        Provider.of<LoadingProvider>(context, listen: false).setLoad(false);
        CustomAlerts.showToast('Something Went Wrong!');

        return;
      }
      _upcomingMovie = UpcomingMovie.fromMap(extractedBody);

      Provider.of<LoadingProvider>(context, listen: false).setLoad(false);
      if (pushReplace) {
        Navigator.of(context).pushReplacementNamed(movieScreen, arguments: {
          'upcomingMovie': _upcomingMovie,
          'selectedDateTime': date
        });
      } else {
        Navigator.of(context).pushNamed(movieScreen, arguments: {
          'upcomingMovie': _upcomingMovie,
          'selectedDateTime': date
        });
      }
    } catch (e) {
      CustomAlerts.showToast('Something Went Wrong!');

      if (kDebugMode) print('error: $e');
      Provider.of<LoadingProvider>(context, listen: false).setLoad(false);
    }
  }

  void getUpComingMovieFromDatePickerTimeLine(
    BuildContext context, {
    required DateTime date,
  }) {
    getUpcomingMovie(context, date: date, pushReplace: true);
  }
}
