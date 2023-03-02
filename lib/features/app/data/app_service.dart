import 'package:beloved_ver2/base/data/remote/base_service.dart';
import 'package:dio/dio.dart';

class AppService extends BaseService {
  static final AppService ins = AppService._();

  AppService._();

  Future<Response> getUserData() async {
    return await dio.get(BaseService.GET_USER_DATA);
  }
}
