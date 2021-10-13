import 'package:flutter/material.dart';
import 'package:flutter_clean_auth/controllers/auth_controller.dart';
import 'package:flutter_clean_auth/screens/reset_password/reset_password.dart';
import 'package:flutter_clean_auth/screens/sign_up/sign_up.dart';
import 'package:flutter_clean_auth/widgets/rounded_elevated_button.dart';
import 'package:flutter_clean_auth/widgets/text_with_textbutton.dart';
import 'package:get/get.dart';

import '../../../config.dart';

class SignInButtons extends StatelessWidget {
  const SignInButtons({
    Key? key,
    @required this.formKey,
    @required this.emailController,
    @required this.passwordController,
  }) : super(key: key);

  final GlobalKey<FormState>? formKey;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Get.to(() => ResetPassword()),
              child: Text('Forgot Password'),
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => Colors.transparent),
              ),
            ),
          ),
          RoundedElevatedButton(
            title: 'Sign In',
            onPressed: () {
              if (formKey!.currentState!.validate()) {
                String email = emailController!.text.trim();
                String password = passwordController!.text;

                _authController.signIn(email, password);
              }
            },
            padding: EdgeInsets.symmetric(
                horizontal: Config.screenWidth! * 0.4,
                vertical: Config.screenHeight! * 0.02),
          ),
          ElevatedButton(
            onPressed: () {
              _authController.signInWithGoogle();
            },
            child: Text('Google Auth'),
          ),
          TextWithTextButton(
            text: 'Don\'t have an account?',
            textButtonText: 'Sign Up',
            onPressed: () => Get.to(() => SignUp()),
          ),
        ],
      ),
    );
  }
}
