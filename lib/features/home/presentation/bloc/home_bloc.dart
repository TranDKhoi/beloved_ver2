part of home;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._useCase) : super(HomeInitial()) {
    on<InitEvent>(_initEvent);
  }

  final HomeUseCase _useCase;

  FutureOr<void> _initEvent(HomeEvent event, Emitter<HomeState> emit) {
    try {} catch (e) {
      ExceptionUtil.handle(e);
    }
  }
}
