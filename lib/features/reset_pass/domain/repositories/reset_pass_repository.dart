import 'package:beloved_ver2/features/forgot_pass/domain/entities/reset_pass_entity.dart';
import 'package:beloved_ver2/features/login/domain/entities/user_entity.dart';

abstract class ResetPassRepository {
  Future<UserEntity> resetPassword(ResetPassEntity entity);
}
