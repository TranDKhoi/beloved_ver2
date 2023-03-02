import 'package:beloved_ver2/features/forgot_pass/domain/entities/reset_pass_entity.dart';
import 'package:beloved_ver2/features/reset_pass/data/models/reset_pass_model.dart';

import '../../../../../base/mapper/base_data_mapper.dart';

class ResetPassDataMapper
    extends BaseDataMapper<ResetPassModel, ResetPassEntity> {
  @override
  ResetPassEntity mapToEntity(ResetPassModel? model) {
    return ResetPassEntity(
      email: model?.email ?? "null",
      password: model?.password ?? "null",
      code: model?.code ?? "0",
    );
  }

  @override
  ResetPassModel mapToModel(ResetPassEntity entity) {
    return ResetPassModel(
      email: entity.email,
      password: entity.password,
      code: entity.code,
    );
  }
}
