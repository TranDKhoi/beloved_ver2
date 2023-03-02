import 'package:beloved_ver2/base/mapper/mapper_di.dart';
import 'package:beloved_ver2/features/login/data/models/login_model.dart';
import 'package:beloved_ver2/utils/extensions/dio_extension.dart';

import '../../domain/entities/login_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/remote/login_service.dart';
import '../models/user_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final MapperDi _mapper;

  LoginRepositoryImpl(this._mapper);

  @override
  Future<UserEntity> login(LoginEntity loginEntity) async {
    LoginModel loginModel = _mapper.loginDataMapper.mapToModel(loginEntity);
    var res = await LoginService.ins.login(loginModel);

    UserModel userModel = UserModel.fromJson(res.serverData);
    UserEntity userEntity = _mapper.userDataMapper.mapToEntity(userModel);
    userEntity.token = res.data["token"];

    return userEntity;
  }
}
