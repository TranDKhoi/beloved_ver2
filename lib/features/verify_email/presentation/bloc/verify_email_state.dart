part of verify_email;

@immutable
abstract class VerifyEmailState extends Equatable {}

class InitState extends VerifyEmailState {
  @override
  List<Object?> get props => [];
}

class SuccessState extends VerifyEmailState {
  @override
  List<Object?> get props => [];
}
