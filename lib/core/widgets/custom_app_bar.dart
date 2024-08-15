  import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/app_style.dart';

AppBar customAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'تسجيل دخول',
        style: AppStyle.body19Bold,
      ),
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new)),
    );
  }
