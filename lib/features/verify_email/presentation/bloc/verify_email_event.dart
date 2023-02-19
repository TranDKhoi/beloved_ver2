part of verify_email;

@immutable
abstract class VerifyEmailEvent extends Equatable {}

class ConfirmButtonClickedEvent extends VerifyEmailEvent {
  final String code;

  ConfirmButtonClickedEvent(this.code);

  @override
  List<Object?> get props => [code];
}
