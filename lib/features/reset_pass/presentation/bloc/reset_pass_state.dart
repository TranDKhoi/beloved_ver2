part of reset_pass;

@immutable
abstract class ResetPassState extends Equatable {}

class InitState extends ResetPassState {
  @override
  List<Object?> get props => [];
}

class SuccessState extends ResetPassState {
  @override
  List<Object?> get props => [];
}
