import 'package:beloved_ver2/features/signup/domain/entities/confirm_entity.dart';

abstract class SignupRepository {
  Future<void> confirmSignup(ConfirmEntity confirmEntity);
}
