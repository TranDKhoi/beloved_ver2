part of reset_pass;

@immutable
abstract class ResetPassEvent extends Equatable {}

class ConfirmButtonClickedEvent extends ResetPassEvent {
  final String pass;
  final String rePass;
  final String token;

  ConfirmButtonClickedEvent(
      {required this.pass, required this.rePass, required this.token});

  @override
  List<Object?> get props => [pass, rePass, token];
}
