part of home;

@immutable
abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeLoadedState extends HomeState {
  final String partnerName;
  final DateTime ourDay;
  final List<String> anniversaries;

  HomeLoadedState({
    required this.partnerName,
    required this.ourDay,
    this.anniversaries = const [],
  });

  @override
  List<Object?> get props => [partnerName, ourDay, anniversaries,];
}
