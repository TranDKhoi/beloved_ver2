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

  LoadedState({required this.currentMode, required this.currentLang});

  LoadedState copyWith({
    ThemeMode? currentTheme,
    String? currentLang,
  }) {
    return LoadedState(
      currentMode: currentMode,
      currentLang: currentLang ?? this.currentLang,
    );
  }

  @override
  List<Object> get props => [
        currentMode,
        currentLang,
      ];
}
