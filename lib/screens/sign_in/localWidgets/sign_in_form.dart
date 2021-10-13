import 'package:flutter/material.dart';
import 'package:flutter_clean_auth/screens/sign_in/localWidgets/sign_in_buttons.dart';
import 'package:flutter_clean_auth/widgets/rounded_text_formfield.dart';

import '../../../config.dart';

class SingInForm extends StatefulWidget {
  const SingInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SingInForm> createState() => _SingInFormState();
}

class _SingInFormState extends State<SingInForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildTextFormField(),
            SignInButtons(
              formKey: _formKey,
              emailController: _emailController,
              passwordController: _passwordController,
            ),
          ],
        ),
      ),
    );
  }

  Column buildTextFormField() {
    return Column(
      children: [
        RoundedTextFormField(
          controller: _emailController,
          hintText: 'Email',
          validator: (value) {
            bool _isEmailValid =
                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$&'*+-/=?^_`{|}~]+@[a-zA-Z]+")
                    .hasMatch(value!);
            if (!_isEmailValid) {
              return 'Invalid email.';
            }
            return null;
          },
        ),
        SizedBox(
          height: Config.screenHeight! * 0.01,
        ),
        RoundedTextFormField(
          obsecureText: true,
          controller: _passwordController,
          hintText: 'Password',
          validator: (value) {
            if (value.toString().length < 6) {
              return 'Password should be longer or equal to 6 characters.';
            }
            return null;
          },
        ),
      ],
    );
  }
}
