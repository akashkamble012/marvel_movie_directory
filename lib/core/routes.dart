//Route Names
import 'package:flutter/material.dart';
import 'package:marvel_movie_directory/screens/auth/sign%20_in_screen.dart';
import 'package:marvel_movie_directory/screens/auth/sign_up.dart';
import 'package:marvel_movie_directory/screens/home_screen.dart';

import '../screens/movie_screen.dart';

const String home = '/';
const String signUpS = 'signUp';
const String signIN = 'signIn';
const String movieScreen = 'movieScreen';

class RouterConfig {
  static Route? onGenerateRoutes(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case signUpS:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
        case signIN:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case movieScreen:
        return MaterialPageRoute(builder: (_) {
          final args = arguments as Map;
          return MovieScreen(
            upcomingMovie: args['upcomingMovie'],
            selectedDateTime: args['selectedDateTime'],
          );
        });
      //Default Screen
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text('Page Not Found')),
                ));
    }
  }
}
