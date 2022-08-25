import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:marvel_movie_directory/screens/auth/sign%20_in_screen.dart';
import 'package:marvel_movie_directory/screens/auth/sign%20_in_screen.dart';
import 'package:marvel_movie_directory/screens/auth/sign_up.dart';
import 'package:marvel_movie_directory/screens/home_screen.dart';

import '../core/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: SpinKitRipple(color: AppColor.white));
            } else if (snapshot.hasError) {
              return const SignInScreen();
            } else if (snapshot.hasData) {
              return const HomeScreen();
            } else {
              return const SignInScreen();
            }
          }),
    );
  }
}
