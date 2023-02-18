part of login;

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonClickedEvent extends LoginEvent {
  const LoginButtonClickedEvent({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
