import 'package:flutter/material.dart';
import 'package:fruit/constants.dart';
import 'package:fruit/core/Utils/app_colors.dart';
import 'package:fruit/core/Utils/app_router.dart';
import 'package:fruit/core/Utils/app_style.dart';
import 'package:fruit/core/widgets/custom_buttton.dart';
import 'package:fruit/core/widgets/custom_text_form_field.dart';

import 'have_account.dart';
import 'terms_and_conditions_widget.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const CustomTextFormField(hintText: 'الاسم كامل'),
            const SizedBox(height: 16),
            const CustomTextFormField(hintText: 'البريد الإلكتروني'),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'كلمة المرور',
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility,
                    color: Color(0xffC9CECE),
                  )),
            ),
            const SizedBox(height: 16),
            const TermsAndConditionsWidget(),
            const SizedBox(height: 30),
            CustomButton(
              text: 'انشاء حساب',
              onTap: () {},
            ),
            const SizedBox(height: 26),
            const HaveAccount(),
          ],
        ),
      ),
    );
  }
}
