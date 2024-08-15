import 'package:flutter/material.dart';
import 'package:fruit/core/widgets/custom_app_bar.dart';

import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,title: 'تسجيل دخول'),
      body: const LoginViewBody(),
    );
  }
}
