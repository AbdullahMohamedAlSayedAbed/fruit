import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/app_style.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xffDCDEDE),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            'أو',
            textAlign: TextAlign.center,
            style:
                AppStyle.body16Semibold.copyWith(color: const Color(0xFF131E1F)),
          ),
        ),
        const Expanded(
          child: Divider(
            color: Color(0xffDCDEDE),
          ),
        ),
      ],
    );
  }
}
