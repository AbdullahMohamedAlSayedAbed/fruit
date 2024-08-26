import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/Features/auth/presentation/cupit/signup_cubit/signup_cubit.dart';
import 'package:fruit/constants.dart';
import 'package:fruit/core/functions/build_error_bar.dart';
import 'package:fruit/core/widgets/custom_buttton.dart';
import 'package:fruit/core/widgets/custom_text_form_field.dart';

import 'have_account.dart';
import 'password_text_field.dart';
import 'terms_and_conditions_widget.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  bool valueCheckBox = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                  onSaved: (value) {
                    name = value!;
                  },
                  keyboardType: TextInputType.name,
                  hintText: 'الاسم كامل'),
              const SizedBox(height: 16),
              CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'البريد الإلكتروني'),
              const SizedBox(height: 16),
              PasswordTextField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 16),
              TermsAndConditionsWidget(
                onChanged: (value) {
                  valueCheckBox = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'انشاء حساب',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (valueCheckBox) {
                      context
                          .read<SignupCubit>()
                          .createUserEmailAndPassword(email, password, name);
                    }else{
                      buildErrorSnackBar(context, 'الرجاء الموافقة على الشروط والاحكام');
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 26),
              const HaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
