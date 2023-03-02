import 'dart:convert';

import 'package:beloved_ver2/base/data/remote/base_service.dart';
import 'package:beloved_ver2/features/verify_email/data/models/verify_email_model.dart';
import 'package:dio/dio.dart';

class VerifyEmailService extends BaseService {
  static final ins = VerifyEmailService._();

  VerifyEmailService._();

  Future<Response> confirmVerifyCode(VerifyEmailModel verifyEmailModel) async {
    return await dio.post(
      BaseService.VERIFY_SIGNUP,
      data: jsonEncode(verifyEmailModel),
    );
  }

  Future<Response> resendVerifyCode(String email, String password) async {
    return await dio.post(
      BaseService.RESEND_SIGNUP,
      data: jsonEncode({"email": email, "password": password}),
    );
  }
}
