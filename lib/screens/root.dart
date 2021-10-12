import 'package:flutter/material.dart';
import 'package:flutter_clean_auth/config.dart';

import 'sign_in/sign_in.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Config.screenWidth! * 0.04),
          child: SignIn(),
        ),
      ),
    );
  }
}
