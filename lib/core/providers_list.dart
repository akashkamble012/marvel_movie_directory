import 'package:marvel_movie_directory/controller/auth_controller.dart';
import 'package:marvel_movie_directory/controller/movie_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AllProviders {
  static List<SingleChildWidget> allProvidersList = [
    ChangeNotifierProvider.value(value: AuthController()),
    ChangeNotifierProvider.value(value: MovieController()),
  ];
}
