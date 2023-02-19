import 'dart:convert';

import 'package:beloved_ver2/base/data/remote/base_service.dart';
import 'package:beloved_ver2/features/user_bio/data/models/create_user_bio_model.dart';
import 'package:dio/dio.dart';

class UserBioService extends BaseService {
  static final ins = UserBioService._();

  UserBioService._();

  Future<Response> saveUserBio(CreateUserBioModel model) async {
    return await dio.put(
      BaseService.SAVE_USER,
      data: jsonEncode(model),
    );
  }
}
