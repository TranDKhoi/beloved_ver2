import 'dart:convert';

import 'package:beloved_ver2/base/data/remote/base_service.dart';
import 'package:beloved_ver2/features/signup/data/models/confirm_model.dart';
import 'package:dio/dio.dart';

class SignupService extends BaseService {
  SignupService._();

  static final ins = SignupService._();

  Future<Response> confirmSignup(ConfirmModel confirmModel) async {
    return await dio.post(
      BaseService.SIGNUP_PATH,
      data: jsonEncode(confirmModel),
    );
  }
}
