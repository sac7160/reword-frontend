import 'package:flutter/material.dart';

import 'components/signInForm.dart';

class SignInEmailScreen extends StatelessWidget {
  static String routeName = "/signInEmail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInForm(),
    );
  }
}
