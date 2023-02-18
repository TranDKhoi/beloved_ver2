part of login;

abstract class LoginState extends Equatable {}

class IdleState extends LoginState {
  @override
  List<Object?> get props => [];
}

class SuccessState extends LoginState {
  @override
  List<Object?> get props => [];
}
