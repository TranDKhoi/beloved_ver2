part of user_bio;

@immutable
abstract class UserBioEvent extends Equatable {}

class InitEvent extends UserBioEvent {
  @override
  List<Object?> get props => [];
}

class ChangeGenderEvent extends UserBioEvent {
  final int gender;

  ChangeGenderEvent(this.gender);

  @override
  List<Object?> get props => [gender];
}

class ChangeBirthDayEvent extends UserBioEvent {
  final DateTime birthDay;

  ChangeBirthDayEvent(this.birthDay);

  @override
  List<Object?> get props => [birthDay];
}

class SaveBioEvent extends UserBioEvent {
  final String name;

  SaveBioEvent(this.name);

  @override
  List<Object?> get props => [name];
}
