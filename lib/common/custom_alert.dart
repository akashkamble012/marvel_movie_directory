import 'package:fluttertoast/fluttertoast.dart';
import 'package:marvel_movie_directory/core/app_colors.dart';
import 'screenUi';

class CustomAlerts {
  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColor.primary,
        textColor: AppColor.secondary,
        fontSize: 16.0);
  }
}
