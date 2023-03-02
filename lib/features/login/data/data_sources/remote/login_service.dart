import 'dart:convert';

import 'package:beloved_ver2/features/login/data/models/login_model.dart';
import 'package:dio/dio.dart';

import '../../../../../base/data/remote/base_service.dart';

class LoginService extends BaseService {
  LoginService._();

  static final ins = LoginService._();

  Future<Response> login(LoginModel loginModel) async {
    return await dio.post(
      BaseService.LOGIN,
      data: jsonEncode(loginModel),
    );
  }
}
