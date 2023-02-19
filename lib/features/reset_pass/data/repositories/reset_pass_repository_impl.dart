import 'package:beloved_ver2/features/reset_pass/data/data_sources/remote/reset_pass_service.dart';
import 'package:beloved_ver2/features/reset_pass/domain/repositories/reset_pass_repository.dart';

class ResetPassRepositoryImpl implements ResetPassRepository {
  @override
  Future<void> resetPassword(String pass, String token) async {
    await ResetPassService.ins.resetPassword(pass, token);
  }
}
