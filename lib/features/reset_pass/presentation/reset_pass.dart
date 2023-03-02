library reset_pass;

import 'dart:async';

import 'package:beloved_ver2/features/forgot_pass/domain/entities/reset_pass_entity.dart';
import 'package:beloved_ver2/features/main_auth/presentation/main_auth.dart';
import 'package:beloved_ver2/features/reset_pass/domain/use_cases/reset_pass_usecase.dart';
import 'package:beloved_ver2/global/variable.dart';
import 'package:beloved_ver2/utils/alert_util.dart';
import 'package:beloved_ver2/utils/exception_util.dart';
import 'package:beloved_ver2/utils/extensions/context_extension.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../commons/m_input_field.dart';
import '../../../commons/m_label_button.dart';
import '../../../configs/colors.dart';
import '../../../configs/dimens.dart';
import '../../../configs/langs/r.dart';
import '../../../configs/styles.dart';
import '../../../di/service_locator.dart';
import '../../../utils/navigation_util.dart';

part 'bloc/reset_pass_bloc.dart';
part 'bloc/reset_pass_event.dart';
part 'bloc/reset_pass_state.dart';
part 'pages/reset_pass_page.dart';
part 'widgets/reset_form.dart';
