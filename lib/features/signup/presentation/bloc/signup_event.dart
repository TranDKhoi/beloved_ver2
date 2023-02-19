part of signup;

@immutable
abstract class SignupEvent extends Equatable {}

class ConfirmButtonClickedEvent extends SignupEvent {
  final String email;
  final String pass;
  final String repass;

  ConfirmButtonClickedEvent({
    required this.email,
    required this.pass,
    required this.repass,
  });

  @override
  List<Object?> get props => [
        email,
        pass,
        repass,
      ];
}
