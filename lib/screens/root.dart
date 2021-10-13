import 'package:flutter/material.dart';
import 'package:flutter_clean_auth/config.dart';
import 'package:flutter_clean_auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

import 'home/home.dart';
import 'sign_in/sign_in.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (_) {
          return SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Config.screenWidth! * 0.04),
              child: _.userProfile != null ? Home() : SignIn(),
            ),
          );
        },
      ),
    );
  }
}
