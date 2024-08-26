import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/Features/auth/presentation/cupit/signup_cubit/signup_cubit.dart';
import 'package:fruit/Features/auth/presentation/widgets/sign_up_view_body.dart';
import 'package:fruit/core/functions/build_error_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupBlocConsumer extends StatelessWidget {
  const SignupBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          
        }
        if (state is SignupFailure) {
          buildErrorSnackBar(context, state.errMassage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading,
          child: const SignUpViewBody());
      },
    );
  }


}
