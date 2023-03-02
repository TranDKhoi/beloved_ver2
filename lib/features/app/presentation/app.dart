import 'package:beloved_ver2/configs/theme.dart';
import 'package:beloved_ver2/di/service_locator.dart';
import 'package:beloved_ver2/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../../utils/global_keys.dart';
import '../../../utils/language_util.dart';
import '../../main_auth/presentation/main_auth.dart';
import 'bloc/app_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceLocator.sl<AppBloc>()..add(InitEvent()),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is LoadedState) {
            return MaterialApp(
              home: state.isVerified
                  ? const BottomNavBar()
                  : const MainAuthPage(),
              navigatorKey: navigatorKey,
              scaffoldMessengerKey: scaffoldKey,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: state.currentMode,
              themeAnimationCurve: Curves.bounceInOut,
              themeAnimationDuration: const Duration(seconds: 1),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: LanguageUtil.ins.supportedLocales,
              locale: LanguageUtil.ins.currentLocale,
            );
          }
          return const Placeholder();
          //sau này thay bằng một màn splash nào đó
        },
      ),
    );
  }
}
