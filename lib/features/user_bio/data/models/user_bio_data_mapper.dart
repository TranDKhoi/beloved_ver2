import 'package:beloved_ver2/base/mapper/base_data_mapper.dart';
import 'package:beloved_ver2/features/user_bio/data/models/create_user_bio_model.dart';
import 'package:beloved_ver2/features/user_bio/domain/entities/create_user_bio.dart';

class UserBioDataMapper
    extends BaseDataMapper<CreateUserBioModel, CreateUserBioEntity> {
  @override
  mapToEntity(model) {
    return CreateUserBioEntity(
        id: model!.id,
        name: model.name,
        gender: model.gender,
        birthDay: model.birthDay);
  }

  @override
  mapToModel(entity) {
    return CreateUserBioModel(
        id: entity.id,
        name: entity.name,
        birthDay: entity.birthDay,
        gender: entity.gender);
  }
}
