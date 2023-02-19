part of signup;

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(this._useCase) : super(InitState()) {
    on<ConfirmButtonClickedEvent>(_onConfirmButtonClicked);
  }

  final SignupUseCase _useCase;

  _onConfirmButtonClicked(
      ConfirmButtonClickedEvent event, Emitter<SignupState> emit) async {
    try {
      var confirmEntity = ConfirmEntity(
        email: event.email.trim(),
        password: event.pass.trim(),
        rePassword: event.repass.trim(),
      );

      AlertUtil.showLoading();
      var res = await _useCase.confirmEmailPassword(confirmEntity);
      AlertUtil.hideLoading();

      emit(ConfirmSuccessState());
      emit(InitState());
    } catch (e) {
      ExceptionUtil.handle(e);
    }
  }
}
