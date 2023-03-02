// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';

import '../../../global/variable.dart';

class BaseService {
  static const String BASE_PATH = "https://10.0.2.2:7143/api/";

  //api route
  static const String LOGIN = "auth/login";
  static const String SIGNUP = "auth/signup";
  static const String VERIFY_SIGNUP = "auth/verify-signup";
  static const String VERIFY_EMAIL = "auth/verify-email";
  static const String RESEND_SIGNUP = "auth/resend-signup";
  static const String FORGOT_PASSWORD = "auth/forgot-password";
  static const String VERIFY_FORGOT = "auth/verify-forgot";
  static const String RESEND_FORGOT = "auth/resend-forgot";
  static const String RESET_PASSWORD = "auth/reset-password";
  static const String UPDATE_USER_BIO = "user";

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
        headers: {"Authorization": GlobalVariable.currentUser?.token},
      ),
    );
  }
}
