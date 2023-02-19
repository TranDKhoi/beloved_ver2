part of user_bio;

@immutable
abstract class UserBioState extends Equatable {}

class InitState extends UserBioState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends UserBioState {
  final int gender;
  final DateTime birthDay;

  LoadedState({required this.gender, required this.birthDay});

  @override
  List<Object?> get props => [gender, birthDay];

  LoadedState copyWith({
    int? gender,
    DateTime? birthDay,
  }) {
    return LoadedState(
      gender: gender ?? this.gender,
      birthDay: birthDay ?? this.birthDay,
    );
  }
}

class SuccessState extends UserBioState {
  @override
  List<Object?> get props => [];
}
