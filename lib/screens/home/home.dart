import 'package:flutter/material.dart';
import 'package:flutter_clean_auth/controllers/auth_controller.dart';
import 'package:flutter_clean_auth/widgets/hero_title.dart';
import 'package:flutter_clean_auth/widgets/rounded_elevated_button.dart';
import 'package:get/get.dart';

import '../../config.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();
    return Center(
      child: Column(
        children: [
          HeroTitle(
              title:
                  'Welcome ${_authController.displayName.toString().capitalizeString()}',
              subtitle: 'Let\'s begin...'),
          Expanded(
            flex: 8,
            child: Container(),
          ),
          ElevatedButton(
              onPressed: () {
                _authController.getGoogleAccessToken();
              },
              child: Text('Token')),
          RoundedElevatedButton(
            title: 'Sign Out!',
            onPressed: () => _authController.signOut(),
            padding: EdgeInsets.symmetric(
              horizontal: Config.screenWidth! * 0.2,
              vertical: Config.screenHeight! * 0.013,
            ),
          )
        ],
      ),
    );
  }
}
