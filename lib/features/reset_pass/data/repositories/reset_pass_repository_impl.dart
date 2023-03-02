import 'package:beloved_ver2/base/mapper/mapper_di.dart';
import 'package:beloved_ver2/features/forgot_pass/domain/entities/reset_pass_entity.dart';
import 'package:beloved_ver2/features/login/data/models/user_model.dart';
import 'package:beloved_ver2/features/login/domain/entities/user_entity.dart';
import 'package:beloved_ver2/features/reset_pass/data/data_sources/remote/reset_pass_service.dart';
import 'package:beloved_ver2/features/reset_pass/domain/repositories/reset_pass_repository.dart';
import 'package:beloved_ver2/utils/extensions/dio_extension.dart';

class ResetPassRepositoryImpl implements ResetPassRepository {
  ResetPassRepositoryImpl(this._mapper);

  final MapperDi _mapper;

  @override
  Future<UserEntity> resetPassword(ResetPassEntity entity) async {
    var resetPassModel = _mapper.resetPassDataMapper.mapToModel(entity);
    var res = await ResetPassService.ins.resetPassword(resetPassModel);
    UserModel userModel = UserModel.fromJson(res.serverData);
    UserEntity userEntity = _mapper.userDataMapper.mapToEntity(userModel);
    userEntity.token = res.data["token"];
    return userEntity;
  }
}
