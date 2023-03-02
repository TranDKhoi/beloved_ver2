import 'package:beloved_ver2/features/login/data/models/user_model.dart';

import '../../../../../base/mapper/base_data_mapper.dart';
import '../../../domain/entities/user_entity.dart';

class UserDataMapper extends BaseDataMapper<UserModel, UserEntity> {
  @override
  UserEntity mapToEntity(UserModel? model) {
    return UserEntity(
      id: model?.id ?? "0",
      email: model?.email ?? "null",
      password: model?.password ?? "null",
      name: model?.name ?? "null",
      gender: model?.gender ?? 0,
      birthDay: model?.birthDay ?? DateTime.now(),
    );
  }

  @override
  UserModel mapToModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      password: entity.password,
      name: entity.name,
      gender: entity.gender,
      birthDay: entity.birthDay,
    );
  }
}
