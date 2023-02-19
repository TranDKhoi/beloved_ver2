import 'package:beloved_ver2/base/data/remote/base_service.dart';
import 'package:dio/dio.dart';

class ResetPassService extends BaseService {
  static final ins = ResetPassService._();

  ResetPassService._();

  Future<Response> resetPassword(String pass, String token) async {
    return await dio.put("");
  }
}
