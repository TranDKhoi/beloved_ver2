part of user_bio;

class UserBioBloc extends Bloc<UserBioEvent, UserBioState> {
  UserBioBloc(this._useCase) : super(InitState()) {
    on<InitEvent>(_initData);
    on<ChangeGenderEvent>(_changeGender);
    on<ChangeBirthDayEvent>(_changeBirthDay);
    on<SaveBioEvent>(_saveBioEvent);
  }

  final UserBioUseCase _useCase;

  FutureOr<void> _initData(InitEvent event, Emitter<UserBioState> emit) {
    emit(LoadedState(gender: 0, birthDay: DateTime.now()));
  }

  FutureOr<void> _changeGender(
      ChangeGenderEvent event, Emitter<UserBioState> emit) {
    emit((state as LoadedState).copyWith(gender: event.gender));
  }

  FutureOr<void> _changeBirthDay(
      ChangeBirthDayEvent event, Emitter<UserBioState> emit) {
    emit((state as LoadedState).copyWith(birthDay: event.birthDay));
  }

  FutureOr<void> _saveBioEvent(
      SaveBioEvent event, Emitter<UserBioState> emit) async {
    try {
      var state = this.state as LoadedState;
      var currentUser = GlobalVariable.currentUser;
      CreateUserBioEntity bio = CreateUserBioEntity(
        id: currentUser?.id ?? "null-id",
        name: event.name.trim(),
        gender: state.gender,
        birthDay: state.birthDay,
      );

      AlertUtil.showLoading();
      var res = await _useCase.saveUserBio(bio);
      AlertUtil.hideLoading();

      //if success then save token to local
      res.token = GlobalVariable.currentUser?.token ?? "null-id";
      SharedService.setUserToken(res.token!);
      //save to global app state
      GlobalVariable.currentUser = res;

      emit(SuccessState());
    } catch (e) {
      ExceptionUtil.handle(e);
    }
  }
}
