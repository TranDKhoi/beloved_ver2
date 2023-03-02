import 'package:beloved_ver2/features/signup/data/data_sources/remote/signup_service.dart';
import 'package:beloved_ver2/features/signup/data/models/signup_model.dart';
import 'package:beloved_ver2/features/signup/domain/entities/signup_entity.dart';
import 'package:beloved_ver2/features/signup/domain/repositories/signup_repository.dart';

class SignupRepositoryImpl implements SignupRepository {
  @override
  Future<void> signup(SignupEntity signupEntity) async {
    var signupModel =
        SignupModel(email: signupEntity.email, password: signupEntity.password);
    await SignupService.ins.confirmSignup(signupModel);
  }
}
