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

      emit(SuccessState());
    } catch (e) {
      ExceptionUtil.handle(e);
    }
  }
}
