import 'package:flutter/material.dart';
import 'package:flutter_clean_auth/screens/sign_in/localWidgets/sign_in_form.dart';
import 'package:flutter_clean_auth/widgets/hero_image.dart';
import 'package:flutter_clean_auth/widgets/hero_title.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // shows header title
        HeroTitle(
          title: 'Welcome!',
          subtitle: 'Enter email and password to login...!',
        ),
        // shows image title
        HeroImage(path: 'assets/images/sign_in_img.png'),
        // shows textfierlds and buttons
        SingInForm(),
      ],
    );
  }
}
