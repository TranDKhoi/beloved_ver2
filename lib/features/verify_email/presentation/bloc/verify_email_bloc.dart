part of verify_email;

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  VerifyEmailBloc(this._useCase) : super(InitState()) {
    on<ConfirmButtonClickedEvent>(_confirmButtonClicked);
  }

  final VerifyEmailUseCase _useCase;

  Future<FutureOr<void>> _confirmButtonClicked(
      ConfirmButtonClickedEvent event, Emitter<VerifyEmailState> emit) async {
    try {
      // AlertUtil.showLoading();
      // var res = await _useCase.sendVerifyCode(event.code.trim());
      // AlertUtil.hideLoading();

      emit(SuccessState());
    } catch (e) {
      ExceptionUtil.handle(e);
    }
  }
}
