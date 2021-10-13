import 'package:flutter/material.dart';
import 'package:flutter_clean_auth/controllers/auth_controller.dart';
import 'package:flutter_clean_auth/widgets/rounded_elevated_button.dart';
import 'package:flutter_clean_auth/widgets/text_with_textbutton.dart';
import 'package:get/get.dart';

import '../../../config.dart';
import '../../root.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _nameController = nameController,
        _emailController = emailController,
        _passwordConroller = passwordController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordConroller;

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();
    
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          RoundedElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                String name = _nameController.text.trim();
                String email = _emailController.text.trim();
                String password = _passwordConroller.text.trim();

                _authController.signUp(name, email, password);
              }
            },
            title: 'Sign Up',
            padding: EdgeInsets.symmetric(
              horizontal: Config.screenWidth! * 0.38,
              vertical: Config.screenHeight! * 0.02,
            ),
          ),
          TextWithTextButton(
            text: 'Already have an account?',
            textButtonText: 'Sign In',
            onPressed: () => Get.offAll(
              () => Root(),
            ),
          ),
        ],
      ),
    );
  }
}
