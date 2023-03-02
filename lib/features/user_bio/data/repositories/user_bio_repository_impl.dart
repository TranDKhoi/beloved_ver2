import 'package:beloved_ver2/base/mapper/mapper_di.dart';
import 'package:beloved_ver2/features/login/domain/entities/user_entity.dart';
import 'package:beloved_ver2/features/user_bio/domain/entities/create_user_bio.dart';
import 'package:beloved_ver2/utils/extensions/dio_extension.dart';

import '../../../login/data/models/user_model.dart';
import '../../domain/repositories/user_bio_repository.dart';
import '../data_sources/user_bio_service.dart';
import '../models/create_user_bio_model.dart';

class UserBioRepositoryImpl implements UserBioRepository {
  UserBioRepositoryImpl(this._mapper);

  final MapperDi _mapper;

  @override
  Future<UserEntity> saveUserBio(CreateUserBioEntity bio) async {
    CreateUserBioModel bioModel = _mapper.userBioDataMapper.mapToModel(bio);
    var res = await UserBioService.ins.saveUserBio(bioModel);

    UserModel userModel = UserModel.fromJson(res.serverData);
    UserEntity userEntity = _mapper.userDataMapper.mapToEntity(userModel);

    return userEntity;
  }
}
