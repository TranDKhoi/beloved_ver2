import 'package:dio/dio.dart';

class BaseService {
  static const String BASE_PATH = "https://cliver-api.azurewebsites.net/api/";

  //api route
  static const String LOGIN_PATH = "auth/login";
  static const String SIGNUP_PATH = "auth/signup";
  static const String VERIFY_EMAIL_PATH = "auth/verify-email";
  static const String SAVE_USER = "user/save";

  late Dio dio;

  //CONSTRUCTOR
  BaseService() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_PATH,
        connectTimeout: const Duration(milliseconds: 10000),
        receiveTimeout: const Duration(milliseconds: 10000),
        responseType: ResponseType.json,
        contentType: Headers.jsonContentType,
      ),
    );
  }
}
