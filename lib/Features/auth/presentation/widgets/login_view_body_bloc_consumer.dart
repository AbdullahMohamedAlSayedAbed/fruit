import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/Features/auth/presentation/cupit/signin_cubit/signin_cubit.dart';
import 'package:fruit/Features/auth/presentation/widgets/login_view_body.dart';
import 'package:fruit/core/functions/build_error_bar.dart';

import '../../../../core/widgets/custom_progress_h_u_d.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          
        }
        if (state is SigninFailure) {
          buildErrorSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
            isLoading: state is SigninLoading, child: const LoginViewBody());
      },
    );
  }
}
