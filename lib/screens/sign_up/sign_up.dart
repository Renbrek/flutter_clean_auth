import 'package:flutter/material.dart';
import 'package:flutter_clean_auth/screens/sign_up/localWidgets/sign_up_buttons.dart';
import 'package:flutter_clean_auth/widgets/hero_title.dart';
import 'package:flutter_clean_auth/widgets/rounded_text_formfield.dart';

import '../../config.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Config.screenWidth! * 0.04),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              HeroTitle(title: 'Sign Up', subtitle: 'Create an account...'),
              Flexible(
                flex: 1,
                child: SizedBox(
                  height: Config.screenHeight! * 0.08,
                ),
              ),
              buildTextFormFields(),
              SignUpButtons(
                formKey: _formKey,
                emailController: _emailController,
                nameController: _nameController,
                passwordController: _passwordController,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Expanded buildTextFormFields() {
    return Expanded(
      flex: 8,
      child: Column(
        children: [
          RoundedTextFormField(
            controller: _nameController,
            hintText: 'Your name',
            validator: (value) {
              if (value.toString().length <= 2) {
                return 'Enter a valid name';
              }
              return null;
            },
          ),
          SizedBox(
            height: Config.screenHeight! * 0.02,
          ),
          RoundedTextFormField(
            controller: _emailController,
            hintText: 'Email',
            validator: (value) {
              bool _isEmailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$&'*+-/=?^_`{|}~]+@[a-zA-Z]+")
                  .hasMatch(value!);
              if (!_isEmailValid) {
                return 'Invalid email.';
              }
              return null;
            },
          ),
          SizedBox(
            height: Config.screenHeight! * 0.02,
          ),
          RoundedTextFormField(
            controller: _passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value.toString().length < 6) {
                return 'Password should be longer or equal to 6 characters.';
              }
              return null;
            },
          ),
          SizedBox(
            height: Config.screenHeight! * 0.02,
          ),
          RoundedTextFormField(
            controller: _passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value.trim() != _passwordController.text.trim()) {
                return 'Passwords does not match!';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
