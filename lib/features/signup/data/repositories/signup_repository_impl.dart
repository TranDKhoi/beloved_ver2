import 'package:beloved_ver2/features/signup/data/data_sources/remote/signup_service.dart';
import 'package:beloved_ver2/features/signup/data/models/confirm_model.dart';
import 'package:beloved_ver2/features/signup/domain/entities/confirm_entity.dart';
import 'package:beloved_ver2/features/signup/domain/repositories/signup_repository.dart';

class SignupRepositoryImpl implements SignupRepository {
  @override
  Future<void> confirmSignup(ConfirmEntity confirmEntity) async {
    var confirmModel = ConfirmModel(
        email: confirmEntity.email, password: confirmEntity.password);
    await SignupService.ins.confirmSignup(confirmModel);
  }
}
