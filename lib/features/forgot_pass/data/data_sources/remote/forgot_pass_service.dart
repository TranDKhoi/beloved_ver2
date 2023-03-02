import 'dart:convert';

import 'package:beloved_ver2/base/data/remote/base_service.dart';
import 'package:dio/dio.dart';

class ForgotPassService extends BaseService {
  static final ins = ForgotPassService._();

  ForgotPassService._();

  Future<Response> sendVerifyCode(String email) async {
    return await dio.post(
      BaseService.FORGOT_PASSWORD,
      queryParameters: {"email": email},
    );
  }

  Future<Response> confirmVerifyCode(String email, String code) async {
    return await dio.post(
      BaseService.VERIFY_FORGOT,
      data: jsonEncode({"email": email, "code": code}),
    );
  }

  Future<Response> resendCode(String email) async {
    return await dio.post(
      BaseService.RESEND_FORGOT,
      queryParameters: {"email": email},
    );
  }
}
