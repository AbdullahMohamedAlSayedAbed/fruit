import 'package:fruit/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit/Features/auth/domin/repos/auth_repo.dart';
import 'package:fruit/core/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupSingleton() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
      AuthRepoImpl(firebaseAuthService: getIt.get<FirebaseAuthService>()));
}
