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
      AlertUtil.showLoading();
      var res = await _useCase.saveUserBio();
      AlertUtil.hideLoading();
    } catch (e) {
      ExceptionUtil.handle(e);
    }
  }
}
