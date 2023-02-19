import 'package:beloved_ver2/features/user_bio/domain/entities/create_user_bio.dart';

abstract class UserBioRepository {
  Future saveUserBio(CreateUserBioEntity bio);
}
