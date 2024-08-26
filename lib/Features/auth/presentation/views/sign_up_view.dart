import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/Features/auth/domin/repos/auth_repo.dart';
import 'package:fruit/Features/auth/presentation/cupit/signup_cubit/signup_cubit.dart';
import 'package:fruit/core/services/get_it_service.dart';
import 'package:fruit/core/widgets/custom_app_bar.dart';
import '../widgets/signup_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(
          context,
          title: 'حساب جديد',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        body: const SignupBlocConsumer(),
      ),
    );
  }
}
