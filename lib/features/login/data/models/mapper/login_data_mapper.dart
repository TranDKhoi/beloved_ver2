import 'package:beloved_ver2/features/login/data/models/login_model.dart';
import 'package:beloved_ver2/features/login/domain/entities/login_entity.dart';

import '../../../../../base/mapper/base_data_mapper.dart';

class LoginDataMapper extends BaseDataMapper<LoginModel, LoginEntity> {
  @override
  LoginEntity mapToEntity(LoginModel? model) {
    return LoginEntity(
      email: model?.email ?? "null",
      password: model?.password ?? "null",
    );
  }

  @override
  LoginModel mapToModel(LoginEntity entity) {
    return LoginModel(
      email: entity.email,
      password: entity.password,
    );
  }
}
