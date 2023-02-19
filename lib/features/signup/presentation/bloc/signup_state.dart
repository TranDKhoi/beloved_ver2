part of signup;

@immutable
abstract class SignupState extends Equatable {}

class InitState extends SignupState {
  @override
  List<Object?> get props => [];
}

class ConfirmSuccessState extends SignupState {
  @override
  List<Object?> get props => [];
}
