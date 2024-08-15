import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/app_style.dart';
import 'package:svg_flutter/svg_flutter.dart'; // Make sure you're using the correct import

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key, required this.text, required this.image, this.onTap});
  final String text;
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFDCDEDE)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            const Spacer(), // Add some spacing between the image and text
            Text(
              text,
              style: AppStyle.body16Semibold,
            ),
            const Spacer(), // Add some spacing between the image and text
          ],
        ),
      ),
    );
  }
}
