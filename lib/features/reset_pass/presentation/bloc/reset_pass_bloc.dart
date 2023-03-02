part of reset_pass;

class ResetPassBloc extends Bloc<ResetPassEvent, ResetPassState> {
  ResetPassBloc(this._useCase) : super(InitState()) {
    on<ConfirmButtonClickedEvent>(_confirmButtonClicked);
  }

  final ResetPassUseCase _useCase;

  Future<void> _confirmButtonClicked(
      ConfirmButtonClickedEvent event, Emitter<ResetPassState> emit) async {
    try {
      AlertUtil.showLoading();
      var res = await _useCase.resetPassword(
        event.pass.trim(),
        event.rePass.trim(),
        event.entity,
      );
      GlobalVariable.currentUser = res;
      AlertUtil.hideLoading();

      emit(SuccessState());
    } catch (e) {
      ExceptionUtil.handle(e);
    }
  }
}
