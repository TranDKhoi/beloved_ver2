part of verify_email;

@immutable
abstract class VerifyEmailEvent extends Equatable {}

class ConfirmButtonClickedEvent extends VerifyEmailEvent {
  final String code;
  final String email;

  ConfirmButtonClickedEvent(this.email, this.code);

  @override
  List<Object?> get props => [email, code];
}

class ResendButtonClickedEvent extends VerifyEmailEvent {
  final String email;
  final String password;

  ResendButtonClickedEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
