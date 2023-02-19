import 'package:beloved_ver2/features/forgot_pass/data/data_sources/remote/forgot_pass_service.dart';
import 'package:beloved_ver2/features/forgot_pass/domain/repositories/forgot_pass_repository.dart';
import 'package:beloved_ver2/utils/extensions/dio_extension.dart';

class ForgotPassRepositoryImpl implements ForgotPassRepository {
  @override
  Future<void> sendVerifyCode(String email) async {
    await ForgotPassService.ins.sendVerifyCode(email);
  }

  @override
  Future<String> confirmVerifyCode(String code) async {
    var res = await ForgotPassService.ins.confirmVerifyCode(code);
    var token = res.serverData;
    return token;
  }
}
