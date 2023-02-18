part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {}

class InitEvent extends AppEvent {
  @override
  List<Object?> get props => [];
}

class ChangeThemeEvent extends AppEvent {
  final String themeMode;

  ChangeThemeEvent({required this.themeMode});

  @override
  List<Object?> get props => [themeMode];
}

class ChangeLanguageEvent extends AppEvent {
  final String langMode;

  ChangeLanguageEvent({required this.langMode});

  @override
  List<Object?> get props => [langMode];
}
