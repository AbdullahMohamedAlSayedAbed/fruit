import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/Features/auth/presentation/cupit/signin_cubit/signin_cubit.dart';
import 'package:fruit/Features/auth/presentation/widgets/password_text_field.dart';
import 'package:fruit/core/Utils/app_colors.dart';
import 'package:fruit/core/Utils/app_style.dart';
import 'package:fruit/core/Utils/assets.dart';
import 'package:fruit/core/widgets/custom_buttton.dart';
import 'package:fruit/core/widgets/custom_text_form_field.dart';

import 'dont_have_account_widget.dart';
import 'or_divider.dart';
import 'social_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email;
  late String password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordTextField(
                onSaved: (value) {
                  password = value!;
                },
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
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().loginUser(email, password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(height: 33),
              const DontHaveAccountWidget(),
              const SizedBox(height: 33),
              const OrDivider(),
              const SizedBox(height: 16),
              SocialLoginButton(
                onTap: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
                text: 'تسجيل بواسطة جوجل',
                image: Assets.imagesGoogleIcons,
              ),
              const SizedBox(height: 16),
              if(Platform.isIOS)
              const Column(
                children: [
                  SocialLoginButton(
                    text: 'تسجيل بواسطة أبل',
                    image: Assets.imagesAppleIcons,
                  ),
                  SizedBox(height: 16),
                ],
              ),
              // SocialLoginButton(
              //   onTap: () {
              //     context.read<SigninCubit>().signInWithFacebook();
              //   },
              //   text: 'تسجيل بواسطة فيسبوك',
              //   image: Assets.imagesFacebookIcon,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
