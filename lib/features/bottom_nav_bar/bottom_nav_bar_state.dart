part of 'bottom_nav_bar_cubit.dart';

@immutable
abstract class BottomNavBarState extends Equatable {}

class BottomNavBarInitial extends BottomNavBarState {
  final int index;

  BottomNavBarInitial(this.index);

  @override
  List<Object?> get props => [index];
}
