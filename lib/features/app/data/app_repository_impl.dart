import 'package:beloved_ver2/base/mapper/mapper_di.dart';
import 'package:beloved_ver2/features/app/domain/app_repository.dart';
import 'package:beloved_ver2/features/login/data/models/user_model.dart';
import 'package:beloved_ver2/features/login/domain/entities/user_entity.dart';
import 'package:beloved_ver2/utils/extensions/dio_extension.dart';

import 'app_service.dart';

class AppRepositoryImpl implements AppRepository {
  AppRepositoryImpl(this._mapper);

  final MapperDi _mapper;

  @override
  Future<UserEntity> getUserData() async {
    var res = await AppService.ins.getUserData();
    UserModel uM = UserModel.fromJson(res.serverData);
    UserEntity uE = _mapper.userDataMapper.mapToEntity(uM);
    return uE;
  }
}
