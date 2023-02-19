import 'dart:convert';

import 'package:beloved_ver2/base/data/remote/base_service.dart';
import 'package:dio/dio.dart';

class UserBioService extends BaseService {
  static final ins = UserBioService._();

  UserBioService._();

  Future<Response> saveUserBio() async {
    return await dio.put(
      BaseService.SAVE_USER,
      data: jsonEncode({"": ""}),
    );
  }
}
