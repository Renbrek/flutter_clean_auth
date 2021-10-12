import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_auth/screens/reset_password/localWidgets/reset_form.dart';
import 'package:flutter_clean_auth/widgets/hero_image.dart';
import 'package:flutter_clean_auth/widgets/hero_title.dart';
import 'package:get/get.dart';

import '../../config.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Config.screenWidth! * 0.04),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.close),
                ),
              ),
              HeroTitle(
                  title: 'Recovery',
                  subtitle: 'Please enter your account email'),
              HeroImage(path: 'assets/images/reset_password_img.png'),
              ResetForm(),
              SizedBox(
                height: Config.screenHeight! * 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
