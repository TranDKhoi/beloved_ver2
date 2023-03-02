part of login;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._useCase) : super(IdleState()) {
    on<LoginButtonClickedEvent>(_loginClickedEvent);
  }

  final LoginUseCase _useCase;

  _loginClickedEvent(LoginButtonClickedEvent event, emit) async {
    try {
      AlertUtil.showLoading();
      var res = await _useCase.login(LoginEntity(
          email: event.email.trim(), password: event.password.trim()));
      AlertUtil.hideLoading();

      //if success then save token to local and
      SharedService.setUserToken(res.token!);
      //save to global app state
      GlobalVariable.currentUser = res;

      emit(SuccessState());
    } catch (e) {
      ExceptionUtil.handle(e);
    }
  }
}
