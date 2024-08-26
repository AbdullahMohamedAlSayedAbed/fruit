import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/Features/auth/domin/repos/auth_repo.dart';
import 'package:fruit/Features/auth/presentation/cupit/signin_cubit/signin_cubit.dart';
import 'package:fruit/core/services/get_it_service.dart';
import 'package:fruit/core/widgets/custom_app_bar.dart';

import '../widgets/login_view_body.dart';
import '../widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, title: 'تسجيل دخول'),
        body: const LoginViewBodyBlocConsumer(),
      ),
    );
  }
}
