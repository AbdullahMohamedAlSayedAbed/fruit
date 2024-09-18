import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/app_style.dart';
import 'package:fruit/core/Utils/assets.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset(Assets.imagesProfilImage),
        title: Text(
          "صباح الخير !..",
          textAlign: TextAlign.right,
          style:
              AppStyle.body16Regular.copyWith(color: const Color(0xFF949D9E)),
        ),
        subtitle: const Text('أحمد مصطفي',
            textAlign: TextAlign.right, style: AppStyle.body16Bold),
        trailing: Container(
          padding: const EdgeInsets.all(8),
          decoration: const ShapeDecoration(
            shape: OvalBorder(),
            color: Color(0xFFEEF8ED),
          ),
          child: SvgPicture.asset(Assets.imagesNotifications),
        ));
  }
}
