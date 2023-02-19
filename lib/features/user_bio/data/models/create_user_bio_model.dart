class CreateUserBioModel {
  final String id;
  final String name;
  final DateTime birthDay;
  final int gender;

  const CreateUserBioModel({
    required this.id,
    required this.name,
    required this.birthDay,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'birthDay': birthDay.toIso8601String(),
      'gender': gender,
    };
  }

  factory CreateUserBioModel.fromJson(Map<String, dynamic> map) {
    return CreateUserBioModel(
      id: map['id'] as String,
      name: map['name'] as String,
      birthDay: map['birthDay'] as DateTime,
      gender: map['gender'] as int,
    );
  }
}
