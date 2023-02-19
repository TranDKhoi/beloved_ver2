import 'package:dio/dio.dart';

extension HandlerApiResponse on Response {
  bool get isSuccess => statusCode.toString().contains("2", 0) ? true : false;

  dynamic get serverData => data["data"];
}

extension HandleDioError on DioError {
  String get errorMessage {
    try {
      //customizable error from BE
      if (response?.data?["message"] != null) {
        return response?.data["message"];
      }

      //this kind of error come from BE framework, can not modify it
      if (response?.data != null) {
        Map<String, dynamic> mapError = response?.data?["errors"];
        String errorMess = "";
        mapError.forEach((key, value) {
          if (value.runtimeType == List) {
            for (var mess in value) {
              errorMess += mess + "\n";
            }
          } else {
            errorMess += "$value\n";
          }
        });
        return errorMess.substring(0, errorMess.length - 1);
      }

      //this error come from Dio package, can not modify it
      if (message != null) {
        return message!;
      }
      return "Unknown error";
    } catch (e) {
      return e.toString();
    }
  }
}
