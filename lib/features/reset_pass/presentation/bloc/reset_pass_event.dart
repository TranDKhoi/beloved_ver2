part of reset_pass;

@immutable
abstract class ResetPassEvent extends Equatable {}

class ConfirmButtonClickedEvent extends ResetPassEvent {
  final String pass;
  final String rePass;
  final ResetPassEntity entity;

  ConfirmButtonClickedEvent(
      {required this.pass, required this.rePass, required this.entity});

  @override
  List<Object?> get props => [pass, rePass, entity];
}
