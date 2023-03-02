part of 'app_bloc.dart';

@immutable
abstract class AppState extends Equatable {}

class LoadingState extends AppState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends AppState {
  final ThemeMode currentMode;
  final String currentLang;
  final bool isVerified;

  LoadedState(
      {required this.currentMode,
      required this.currentLang,
      this.isVerified = false});

  LoadedState copyWith(
      {ThemeMode? currentTheme, String? currentLang, bool? isVerified}) {
    return LoadedState(
      currentMode: currentMode,
      currentLang: currentLang ?? this.currentLang,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  @override
  List<Object> get props => [
        currentMode,
        currentLang,
        isVerified,
      ];
}
