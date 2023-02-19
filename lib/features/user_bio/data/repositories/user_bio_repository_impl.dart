import '../../domain/repositories/user_bio_repository.dart';
import '../data_sources/user_bio_service.dart';

class UserBioRepositoryImpl implements UserBioRepository {
  @override
  Future saveUserBio() async {
    await UserBioService.ins.saveUserBio();
  }
}
