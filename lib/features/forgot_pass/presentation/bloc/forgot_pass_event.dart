part of forgot_pass;

@immutable
abstract class ForgotPassEvent extends Equatable {}

class ConfirmEmailEvent extends ForgotPassEvent {
  final String email;

  ConfirmEmailEvent(this.email);

  @override
  List<Object?> get props => [email];
}

class ConfirmCodeEvent extends ForgotPassEvent {
  final String email;
  final String code;

  ConfirmCodeEvent(this.email, this.code);

  @override
  List<Object?> get props => [email, code];
}

class ResendButtonClickedEvent extends ForgotPassEvent {
  final String email;

  ResendButtonClickedEvent(this.email);
  @override
  List<Object?> get props => [email];
}
