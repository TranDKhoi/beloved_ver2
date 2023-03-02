import 'package:beloved_ver2/features/login/data/models/mapper/login_data_mapper.dart';
import 'package:beloved_ver2/features/login/data/models/mapper/user_data_mapper.dart';
import 'package:beloved_ver2/features/user_bio/data/models/user_bio_data_mapper.dart';

import '../../features/reset_pass/data/models/mapper/reset_pass_data_mapper.dart';
import '../../features/verify_email/data/models/verify_email_mapper.dart';

class MapperDi {
  final UserDataMapper userDataMapper = UserDataMapper();
  final LoginDataMapper loginDataMapper = LoginDataMapper();
  final VerifyEmailMapper verifyEmailMapper = VerifyEmailMapper();
  final UserBioDataMapper userBioDataMapper = UserBioDataMapper();
  final ResetPassDataMapper resetPassDataMapper = ResetPassDataMapper();
}
