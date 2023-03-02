import 'dart:convert';

import 'package:beloved_ver2/base/data/remote/base_service.dart';
import 'package:dio/dio.dart';

import '../../models/reset_pass_model.dart';

class ResetPassService extends BaseService {
  static final ins = ResetPassService._();

  ResetPassService._();

  Future<Response> resetPassword(ResetPassModel resetPassModel) async {
    return await dio.post(
      BaseService.RESET_PASSWORD,
      data: jsonEncode(resetPassModel),
    );
  }
}
