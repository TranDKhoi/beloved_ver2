import 'package:beloved_ver2/features/login/data/models/user_model.dart';

import '../../../../base/mapper/base_data_mapper.dart';
import '../../domain/entities/user_entity.dart';

class UserDataMapper extends BaseDataMapper<UserModel, UserEntity> {
  @override
  UserEntity mapToEntity(UserModel? model) {
    return UserEntity(
      name: model?.name ?? "",
      age: model?.age ?? 0,
    );
  }

  @override
  UserModel mapToModel(UserEntity entity) {
    return UserModel(
      name: entity.name,
      age: entity.age,
    );
  }
}
