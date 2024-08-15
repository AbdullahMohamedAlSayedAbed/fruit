import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/app_colors.dart';
import 'package:fruit/core/Utils/app_style.dart';
import 'package:fruit/core/Utils/assets.dart';
import 'package:fruit/core/widgets/custom_buttton.dart';
import 'package:fruit/core/widgets/custom_text_form_field.dart';

import 'dont_have_account_widget.dart';
import 'or_divider.dart';
import 'social_login_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility,
                    color: Color(0xffC9CECE),
                  )),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('نسيت كلمة المرور؟',
                    style: AppStyle.body13Semibold.copyWith(
                      color: AppColors.lightPrimary,
                    )),
              ],
            ),
            const SizedBox(height: 33),
            CustomButton(
              text: 'تسجيل الدخول',
              onTap: () {},
            ),
            const SizedBox(height: 33),
            const DontHaveAccountWidget(),
            const SizedBox(height: 33),
            const OrDivider(),
            const SizedBox(height: 16),
            const SocialLoginButton(
              text: 'تسجيل بواسطة جوجل',
              image: Assets.imagesGoogleIcons,
            ),
            const SizedBox(height: 16),
            const SocialLoginButton(
              text: 'تسجيل بواسطة أبل',
              image: Assets.imagesAppleIcons,
            ),
            const SizedBox(height: 16),
            const SocialLoginButton(
              text: 'تسجيل بواسطة فيسبوك',
              image: Assets.imagesFacebookIcon,
            ),
          ],
        ),
      ),
    );
  }
}
