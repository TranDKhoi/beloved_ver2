import 'package:beloved_ver2/base/mapper/base_data_mapper.dart';
import 'package:beloved_ver2/features/verify_email/data/models/verify_email_model.dart';
import 'package:beloved_ver2/features/verify_email/domain/entities/verify_email_entity.dart';

class VerifyEmailMapper
    extends BaseDataMapper<VerifyEmailModel, VerifyEmailEntity> {
  @override
  VerifyEmailEntity mapToEntity(VerifyEmailModel? model) {
    return VerifyEmailEntity(
      email: model?.email ?? "null",
      code: model?.code ?? "0",
    );
  }

  @override
  VerifyEmailModel mapToModel(VerifyEmailEntity entity) {
    return VerifyEmailModel(
      email: entity.email,
      code: entity.code,
    );
  }
}
