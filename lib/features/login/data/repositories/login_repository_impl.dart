import 'package:beloved_ver2/utils/extensions/dio_extension.dart';

import '../../domain/entities/login_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/remote/login_service.dart';
import '../models/user_data_mapper.dart';
import '../models/user_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final UserDataMapper _userDataMapper;

  LoginRepositoryImpl(this._userDataMapper);

  @override
  Future<UserEntity> login(LoginEntity loginEntity) async {
    var res =
        await LoginService.ins.login(loginEntity.email, loginEntity.password);

    UserModel userModel = UserModel.fromJson(res.serverData);
    UserEntity userEntity = _userDataMapper.mapToEntity(userModel);

    return userEntity;
  }
}
