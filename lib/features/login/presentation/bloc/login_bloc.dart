part of login;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(IdleState()) {
    on<LoginButtonClickedEvent>(_loginClickedEvent);
  }

  _loginClickedEvent(LoginButtonClickedEvent event, emit) async {
    try {
      AlertUtil.showLoading();
      var res = await Injector.loginUseCase.login(LoginEntity(
          email: event.email.trim(), password: event.password.trim()));
      AlertUtil.hideLoading();

      emit(SuccessState());
    } catch (e) {
      ExceptionUtil.handle(e);
    }
  }
}
