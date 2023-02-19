import 'dart:convert';

import 'package:beloved_ver2/base/data/remote/base_service.dart';
import 'package:dio/dio.dart';

class ForgotPassService extends BaseService {
  static final ins = ForgotPassService._();

  ForgotPassService._();

  Future<Response> sendVerifyCode(String email) async {
    return await dio.get("", data: jsonEncode({"email": email}));
  }

  Future<Response> confirmVerifyCode(String code) async {
    return await dio.get("", data: jsonEncode({"code": code}));
  }
}
