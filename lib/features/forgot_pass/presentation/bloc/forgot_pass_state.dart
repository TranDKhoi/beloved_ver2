part of forgot_pass;

@immutable
abstract class ForgotPassState extends Equatable {}

class InitState extends ForgotPassState {
  @override
  List<Object?> get props => [];
}

class ConfirmSuccessState extends ForgotPassState {
  @override
  List<Object?> get props => [];
}

class ConfirmCodeSuccessState extends ForgotPassState {
  final String token;

  ConfirmCodeSuccessState(this.token);

  @override
  List<Object?> get props => [token];
}
