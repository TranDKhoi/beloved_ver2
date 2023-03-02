import 'package:beloved_ver2/base/mapper/mapper_di.dart';
import 'package:beloved_ver2/features/forgot_pass/domain/repositories/forgot_pass_repository.dart';
import 'package:beloved_ver2/features/forgot_pass/presentation/forgot_pass.dart';
import 'package:beloved_ver2/features/reset_pass/presentation/reset_pass.dart';
import 'package:beloved_ver2/features/signup/data/repositories/signup_repository_impl.dart';
import 'package:beloved_ver2/features/signup/domain/repositories/signup_repository.dart';
import 'package:beloved_ver2/features/signup/domain/use_cases/signup_usecase.dart';
import 'package:beloved_ver2/features/signup/presentation/signup.dart';
import 'package:beloved_ver2/features/user_bio/domain/repositories/user_bio_repository.dart';
import 'package:beloved_ver2/features/user_bio/presentation/user_bio.dart';
import 'package:beloved_ver2/features/verify_email/data/repositories/verify_email_repository_impl.dart';
import 'package:beloved_ver2/features/verify_email/domain/use_cases/verify_email_usecase.dart';
import 'package:beloved_ver2/features/verify_email/presentation/verify_email.dart';
import 'package:get_it/get_it.dart';

import '../features/forgot_pass/data/repositories/forgot_pass_repository_impl.dart';
import '../features/forgot_pass/domain/use_cases/forgot_pass_usecase.dart';
import '../features/login/data/repositories/login_repository_impl.dart';
import '../features/login/domain/repositories/login_repository.dart';
import '../features/login/domain/use_cases/login_usecase.dart';
import '../features/login/presentation/login.dart';
import '../features/reset_pass/data/repositories/reset_pass_repository_impl.dart';
import '../features/reset_pass/domain/repositories/reset_pass_repository.dart';
import '../features/reset_pass/domain/use_cases/reset_pass_usecase.dart';
import '../features/user_bio/data/repositories/user_bio_repository_impl.dart';
import '../features/user_bio/domain/use_cases/user_bio_usecase.dart';
import '../features/verify_email/domain/repositories/verify_email_repository.dart';

class ServiceLocator {
  static final sl = GetIt.instance;

  Future<void> initialize() async {
    sl.registerLazySingleton(() => MapperDi());
    _loginFeat();
    _signupFeat();
    _verifyEmailFeat();
    _userBioFeat();
    _forgotPassFeat();
    _resetPassFeat();
  }

  void _loginFeat() {
    sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCaseImpl(sl()));
    sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));
  }

  void _signupFeat() {
    sl.registerLazySingleton<SignupRepository>(() => SignupRepositoryImpl());
    sl.registerLazySingleton<SignupUseCase>(() => SignupUseCaseImpl(sl()));
    sl.registerFactory<SignupBloc>(() => SignupBloc(sl()));
  }

  void _verifyEmailFeat() {
    sl.registerLazySingleton<VerifyEmailRepository>(
        () => VerifyEmailRepositoryImpl(sl()));
    sl.registerLazySingleton<VerifyEmailUseCase>(
        () => VerifyEmailUseCaseImpl(sl()));
    sl.registerFactory<VerifyEmailBloc>(() => VerifyEmailBloc(sl()));
  }

  void _userBioFeat() {
    sl.registerLazySingleton<UserBioRepository>(
        () => UserBioRepositoryImpl(sl()));
    sl.registerLazySingleton<UserBioUseCase>(() => UserBioUseCaseImpl(sl()));
    sl.registerFactory<UserBioBloc>(() => UserBioBloc(sl()));
  }

  void _forgotPassFeat() {
    sl.registerLazySingleton<ForgotPassRepository>(
        () => ForgotPassRepositoryImpl());
    sl.registerLazySingleton<ForgotPassUseCase>(
        () => ForgotPassUseCaseImpl(sl()));
    sl.registerFactory<ForgotPassBloc>(() => ForgotPassBloc(sl()));
  }

  void _resetPassFeat() {
    sl.registerLazySingleton<ResetPassRepository>(
        () => ResetPassRepositoryImpl(sl()));
    sl.registerLazySingleton<ResetPassUseCase>(
        () => ResetPassUseCaseImpl(sl()));
    sl.registerFactory<ResetPassBloc>(() => ResetPassBloc(sl()));
  }
}
