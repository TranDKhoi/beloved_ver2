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
  final ResetPassEntity resetPassEntity;

  ConfirmCodeSuccessState(this.resetPassEntity);

  @override
  List<Object?> get props => [resetPassEntity];
}
