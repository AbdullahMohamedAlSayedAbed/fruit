  import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/app_style.dart';

AppBar customAppBar(BuildContext context,{required String title, void Function()? onPressed}) {
    return AppBar(
      backgroundColor: Colors.white,
      title:  Text(
        title,
        style: AppStyle.body19Bold,
      ),
      centerTitle: true,
      leading: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.arrow_back_ios_new)),
    );
  }
