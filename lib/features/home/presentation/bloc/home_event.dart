part of home;

@immutable
abstract class HomeEvent extends Equatable {}

class InitEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
