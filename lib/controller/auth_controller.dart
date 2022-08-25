import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marvel_movie_directory/common/custom_alert.dart';
import 'package:marvel_movie_directory/controller/loading_provider.dart';
import 'package:provider/provider.dart';

import '../core/routes.dart';

enum AuthType { signUp, signIn }

class AuthController with ChangeNotifier {
  AuthType _authType = AuthType.signIn;

  AuthType get authType => _authType;

  void changeAuthType() {
    if (_authType == AuthType.signIn) {
      _authType = AuthType.signUp;
    }
    if (_authType == AuthType.signUp) {
      _authType = AuthType.signIn;
    }
    notifyListeners();
  }

  void signUp(BuildContext context,
      {required String email, required String password}) async {
    try {
      Provider.of<LoadingProvider>(context, listen: false).setLoad(true);
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user == null) {
        Provider.of<LoadingProvider>(context, listen: false).setLoad(false);
        CustomAlerts.showToast('Something Went Wrong!');
        return;
      }
      // ignore: use_build_context_synchronously
      Provider.of<LoadingProvider>(context, listen: false).setLoad(false);
      Navigator.of(context).pushNamedAndRemoveUntil(home, (route) => false);
    } catch (e) {
      Navigator.of(context).pushNamedAndRemoveUntil(home, (route) => false);
      CustomAlerts.showToast('Something Went Wrong!');

      if (kDebugMode) {
        print(e);
      }
    }
  }

  void signIn(BuildContext context,
      {required String email, required String password}) async {
    try {
      Provider.of<LoadingProvider>(context, listen: false).setLoad(true);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user == null) {
        Provider.of<LoadingProvider>(context, listen: false).setLoad(false);
        CustomAlerts.showToast('Something Went Wrong!');

        return;
      }
      Provider.of<LoadingProvider>(context, listen: false).setLoad(false);
      Navigator.of(context).pushNamedAndRemoveUntil(home, (route) => false);
    } catch (e) {
      Navigator.of(context).pushNamedAndRemoveUntil(home, (route) => false);
      CustomAlerts.showToast('Something Went Wrong!');

      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(signUpS, (route) => false);
  }
}
