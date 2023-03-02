import 'package:beloved_ver2/features/signup/domain/entities/signup_entity.dart';

abstract class SignupRepository {
  Future<void> signup(SignupEntity signupEntity);
}
