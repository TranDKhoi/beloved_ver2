part of forgot_pass;

class ForgotPassBloc extends Bloc<ForgotPassEvent, ForgotPassState> {
  ForgotPassBloc(this._useCase) : super(InitState()) {
    on<ConfirmEmailEvent>(_confirmEmailEvent);
    on<ConfirmCodeEvent>(_confirmCodeEvent);
    on<ResendButtonClickedEvent>(_resendCodeButtonClicked);
  }

  final ForgotPassUseCase _useCase;

  Future<void> _confirmEmailEvent(
      ConfirmEmailEvent event, Emitter<ForgotPassState> emit) async {
    try {
      AlertUtil.showLoading();
      await _useCase.sendVerifyCode(event.email.trim());
      AlertUtil.hideLoading();
      emit(ConfirmSuccessState());
    } catch (e) {
      ExceptionUtil.handle(e);
    }
  }

  Future<void> _confirmCodeEvent(
      ConfirmCodeEvent event, Emitter<ForgotPassState> emit) async {
    try {
      AlertUtil.showLoading();
      var token = await _useCase.confirmVerifyCode(
        event.email.trim(),
        event.code.trim(),
      );
      AlertUtil.hideLoading();

      ResetPassEntity entity =
          ResetPassEntity(email: event.email.trim(), password: '', code: token);

      emit(ConfirmCodeSuccessState(entity));
    } catch (e) {
      ExceptionUtil.handle(e);
    }
  }

  Future<void> _resendCodeButtonClicked(
      ResendButtonClickedEvent event, Emitter<ForgotPassState> emit) async {
    try {
      AlertUtil.showLoading();
      await _useCase.resendCode(event.email.trim());
      AlertUtil.hideLoading();
      emit(ConfirmSuccessState());
    } catch (e) {
      ExceptionUtil.handle(e);
    }
  }
}
