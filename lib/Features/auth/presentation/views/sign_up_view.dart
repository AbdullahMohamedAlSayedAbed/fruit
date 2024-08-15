import 'package:flutter/material.dart';
import 'package:fruit/core/widgets/custom_app_bar.dart';

import '../widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,title: 'حساب جديد',onPressed: () {
        Navigator.of(context).pop();
      },),
      body: const SignUpViewBody(),
    );
  }
}
