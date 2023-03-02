import 'dart:io';

import 'package:flutter/material.dart';

import 'di/service_locator.dart';
import 'features/app/presentation/app.dart';
import 'services/shared_service.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();

  await _initialize.call();
  runApp(const MyApp());
}

// có class này thì mới call api tới localhost ở máy thật được
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedService.init();
  ServiceLocator().initialize();
}
