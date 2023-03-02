part of verify_email;

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  VerifyEmailBloc(this._useCase) : super(InitState()) {
    on<ConfirmButtonClickedEvent>(_confirmButtonClicked);
    on<ResendButtonClickedEvent>(_resendButtonClicked);
  }

  final VerifyEmailUseCase _useCase;

  Future<void> _confirmButtonClicked(
      ConfirmButtonClickedEvent event, Emitter<VerifyEmailState> emit) async {
    try {
      var verifyEntity =
          VerifyEmailEntity(email: event.email, code: event.code);

      AlertUtil.showLoading();
      var res = await _useCase.confirmVerifyCode(verifyEntity);
      GlobalVariable.currentUser = res;
      AlertUtil.hideLoading();

      emit(SuccessState());
    } catch (e) {
      ExceptionUtil.handle(e);
    }
  }

  FutureOr<void> _resendButtonClicked(
      ResendButtonClickedEvent event, Emitter<VerifyEmailState> emit) async {
    try {
      AlertUtil.showLoading();
      await _useCase.resendVerifyCode(
          event.email.trim(), event.password.trim());
      AlertUtil.hideLoading();
      AlertUtil.showToast(R.resendcodesuccess.translate);
    } catch (e) {
      ExceptionUtil.handle(e);
    }
  }
}
