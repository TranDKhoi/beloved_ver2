import 'package:beloved_ver2/features/user_bio/data/models/user_bio_data_mapper.dart';
import 'package:beloved_ver2/features/user_bio/domain/entities/create_user_bio.dart';

import '../../domain/repositories/user_bio_repository.dart';
import '../data_sources/user_bio_service.dart';
import '../models/create_user_bio_model.dart';

class UserBioRepositoryImpl implements UserBioRepository {
  UserBioRepositoryImpl(this._mapper);

  final UserBioDataMapper _mapper;

  @override
  Future saveUserBio(CreateUserBioEntity bio) async {
    CreateUserBioModel bioModel = _mapper.mapToModel(bio);
    await UserBioService.ins.saveUserBio(bioModel);
  }
}
