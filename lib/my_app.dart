import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_movie_directory/core/routes.dart';
import 'package:marvel_movie_directory/screens/auth/sign_up.dart';
import 'package:marvel_movie_directory/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../screens/splash_screen.dart';
import 'core/providers_list.dart';
import 'core/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AllProviders.allProvidersList,
      child: ScreenUtilInit(
        designSize: const Size(368, 892), //360, 690
        builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: home,
            onGenerateRoute: RouterConfig.onGenerateRoutes,
            theme: MyTheme.myTheme,
            builder: LoadingScreen.init(),
            home: const SplashScreen()),
      ),
    );
  }
}
