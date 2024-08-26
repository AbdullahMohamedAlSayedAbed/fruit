
import 'package:bloc/bloc.dart';
import 'package:fruit/Features/auth/domin/entites/user_entity.dart';
import 'package:fruit/Features/auth/domin/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;

  Future<void> createUserEmailAndPassword(
      String email, String password, String name) async {
    emit(SignupLoading());
    final result =
        await authRepo.createUserEmailAndPassword(email, password, name);
    result.fold((failure) {
      emit(SignupFailure(failure.message));
    }, (user) {
      emit(SignupSuccess(user));
    });
  }
}
