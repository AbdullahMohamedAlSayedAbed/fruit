import 'package:bloc/bloc.dart';
import 'package:fruit/Features/auth/domin/entites/user_entity.dart';
import 'package:fruit/Features/auth/domin/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;

  Future<void> loginUser(String email, String password) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold((failure) {
      emit(SigninFailure(failure.message));
    }, (user) {
      emit(SigninSuccess(user));
    });
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold((failure) {
      emit(SigninFailure(failure.message));
    }, (user) {
      emit(SigninSuccess(user));
    });
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold((failure) {
      emit(SigninFailure(failure.message));
    }, (user) {
      emit(SigninSuccess(user));
    });
  }
}
