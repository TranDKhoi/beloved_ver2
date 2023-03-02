import 'package:beloved_ver2/base/mapper/mapper_di.dart';
import 'package:beloved_ver2/features/verify_email/data/data_sources/remote/verify_email_service.dart';
import 'package:beloved_ver2/features/verify_email/domain/entities/verify_email_entity.dart';
import 'package:beloved_ver2/features/verify_email/domain/repositories/verify_email_repository.dart';
import 'package:beloved_ver2/utils/extensions/dio_extension.dart';

import '../../../login/data/models/user_model.dart';
import '../../../login/domain/entities/user_entity.dart';

class VerifyEmailRepositoryImpl implements VerifyEmailRepository {
  VerifyEmailRepositoryImpl(this._mapper);

  final MapperDi _mapper;

  @override
  Future<UserEntity> confirmVerifyCode(VerifyEmailEntity verifyEntity) async {
    var verifyModel = _mapper.verifyEmailMapper.mapToModel(verifyEntity);
    var res = await VerifyEmailService.ins.confirmVerifyCode(verifyModel);

    UserModel userModel = UserModel.fromJson(res.serverData);
    UserEntity userEntity = _mapper.userDataMapper.mapToEntity(userModel);
    userEntity.token = res.data["token"];
    return userEntity;
  }

  @override
  Future<void> resendVerifyCode(String email, String password) async {
    await VerifyEmailService.ins.resendVerifyCode(email, password);
  }
}
