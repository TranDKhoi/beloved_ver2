import 'dart:convert';

import 'package:beloved_ver2/base/data/remote/base_service.dart';
import 'package:dio/dio.dart';

class VerifyEmailService extends BaseService {
  static final ins = VerifyEmailService._();

  VerifyEmailService._();

  Future<Response> confirmVerifyCode(String code) async {
    return await dio.post(
      BaseService.VERIFY_EMAIL_PATH,
      data: jsonEncode({"code": code}),
    );
  }

  Future<Response> resendVerifyCode(String email) async {
    return await dio.get(
      BaseService.VERIFY_EMAIL_PATH,
      data: jsonEncode({"email": email}),
    );
  }
}
