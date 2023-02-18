import 'package:dio/dio.dart';

import '../../../../../base/data/remote/base_service.dart';

class LoginService extends BaseService {
  LoginService._();

  static final ins = LoginService._();

  Future<Response> login(String email, String password) async {
    return await dio.post(
      BaseService.LOGIN_PATH,
      data: {"email": "test@gmail.com", "password": "123123123"},
    );
  }
}
