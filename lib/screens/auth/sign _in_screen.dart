import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_movie_directory/common/utils/validation_utils.dart';
import 'package:marvel_movie_directory/common/widgets/body_wrapper.dart';
import 'package:marvel_movie_directory/common/widgets/buttons/custom_elevated_button.dart';
import 'package:marvel_movie_directory/common/widgets/textboxes/custom_text_boxes.dart';
import 'package:marvel_movie_directory/controller/auth_controller.dart';
import 'package:marvel_movie_directory/core/app_colors.dart';
import 'package:marvel_movie_directory/core/routes.dart';
import 'package:provider/provider.dart';

import '../../core/styles.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthController>(context);
    return Scaffold(
      body: BodyWrapper(
        child: Form(
          key: _key,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InputBoxFill(
                labelText: 'Email',
                controller: _emailTextEditingController,
                validator: (value) {
                  if (value!.isEmpty) return 'Required';
                  if (!ValidationUtils.isValidEmail(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              Styles.sizedBoxH20,
              InputBoxFill(
                labelText: 'Password',
                controller: _passwordTextEditingController,
                validator: (value) {
                  if (value!.isEmpty) return 'Required';
                  if (value.length < 6) {
                    return 'Password must be 6 characters long';
                  }
                  return null;
                },
              ),
              Styles.sizedBoxH20,
              Styles.sizedBoxH20,
              CustomElevatedButton(
                buttonName: 'SIGN IN',
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (!_key.currentState!.validate()) {
                    return;
                  }
                  controller.signIn(context,
                      email: _emailTextEditingController.text.trim(),
                      password: _passwordTextEditingController.text.trim());
                },
                size: Size(300.w, 40.h),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: Styles.bodyFont,
                  ),
                  Styles.sizedBoxW04,
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      _emailTextEditingController.clear();
                      _passwordTextEditingController.clear();
                      Navigator.of(context).pushReplacementNamed(signUpS);
                    },
                    child: Text(
                      'Sign up',
                      style: Styles.buttonTextStyle
                          .copyWith(color: AppColor.secondary),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }
}
