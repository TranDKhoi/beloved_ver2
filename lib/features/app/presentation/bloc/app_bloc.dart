import 'package:beloved_ver2/features/app/domain/app_usecase.dart';
import 'package:beloved_ver2/services/shared_service.dart';
import 'package:beloved_ver2/utils/language_util.dart';
import 'package:beloved_ver2/utils/theme_util.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global/variable.dart';
import '../../../../utils/exception_util.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(this._useCase) : super(LoadingState()) {
    on<InitEvent>(_loadAppSetting);
    on<ChangeThemeEvent>(_changeThemeFunc);
    on<ChangeLanguageEvent>(_changeLangFunc);
  }

  final AppUseCase _useCase;

  void _changeThemeFunc(ChangeThemeEvent event, Emitter<AppState> emit) {}

  void _changeLangFunc(ChangeLanguageEvent event, Emitter<AppState> emit) {
    var langCode = event.langMode;
    LanguageUtil.ins.changeLanguage(langCode);

    emit((state as LoadedState).copyWith(currentLang: langCode));
  }

  void _loadAppSetting(InitEvent event, Emitter<AppState> emit) async {
    try {
      LanguageUtil.ins.getLocalLanguage();
      ThemeUtil.ins.getLocalTheme();
      var userToken = SharedService.getUserToken();

      if (userToken != null) {
        GlobalVariable.token = userToken;
        var user = await _useCase.getUserData();
        GlobalVariable.currentUser = user;
      }

      emit(LoadedState(
        currentMode: ThemeUtil.currentMode,
        currentLang: LanguageUtil.currentLanguage,
        isVerified: true,
      ));
    } catch (e) {
      ExceptionUtil.handle(e);
    }
  }
}
