library login;

import 'package:beloved_ver2/commons/m_icon_text_button.dart';
import 'package:beloved_ver2/configs/dimens.dart';
import 'package:beloved_ver2/configs/styles.dart';
import 'package:beloved_ver2/di/service_locator.dart';
import 'package:beloved_ver2/features/login/domain/entities/login_entity.dart';
import 'package:beloved_ver2/global/variable.dart';
import 'package:beloved_ver2/services/shared_service.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';
import 'package:beloved_ver2/utils/navigation_util.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../commons/m_input_field.dart';
import '../../../configs/colors.dart';
import '../../../configs/langs/r.dart';
import '../../../utils/alert_util.dart';
import '../../../utils/exception_util.dart';
import '../../forgot_pass/presentation/forgot_pass.dart';
import '../domain/use_cases/login_usecase.dart';

part 'bloc/login_bloc.dart';
part 'bloc/login_event.dart';
part 'bloc/login_state.dart';
part 'pages/login_form.dart';
