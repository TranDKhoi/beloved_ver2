import 'package:beloved_ver2/utils/language_util.dart';
import 'package:beloved_ver2/utils/theme_util.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(LoadingState()) {
    on<InitEvent>(_loadAppSetting);
    on<ChangeThemeEvent>(_changeThemeFunc);
    on<ChangeLanguageEvent>(_changeLangFunc);
  }

  void _changeThemeFunc(ChangeThemeEvent event, Emitter<AppState> emit) {}

  void _changeLangFunc(ChangeLanguageEvent event, Emitter<AppState> emit) {
    var langCode = event.langMode;
    LanguageUtil.ins.changeLanguage(langCode);

    emit((state as LoadedState).copyWith(currentLang: langCode));
  }

  void _loadAppSetting(InitEvent event, Emitter<AppState> emit) {
    LanguageUtil.ins.getLocalLanguage();
    ThemeUtil.ins.getLocalTheme();

    emit(LoadedState(
        currentMode: ThemeUtil.currentMode,
        currentLang: LanguageUtil.currentLanguage));
  }
}
