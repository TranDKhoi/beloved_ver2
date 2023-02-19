library forgot_pass;

import 'dart:async';

import 'package:beloved_ver2/commons/m_input_field.dart';
import 'package:beloved_ver2/features/forgot_pass/domain/use_cases/forgot_pass_usecase.dart';
import 'package:beloved_ver2/utils/alert_util.dart';
import 'package:beloved_ver2/utils/extensions/context_extension.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../commons/m_label_button.dart';
import '../../../configs/colors.dart';
import '../../../configs/dimens.dart';
import '../../../configs/langs/r.dart';
import '../../../configs/styles.dart';
import '../../../di/service_locator.dart';
import '../../../utils/exception_util.dart';
import '../../../utils/navigation_util.dart';
import '../../reset_pass/presentation/reset_pass.dart';

part 'bloc/forgot_pass_bloc.dart';
part 'bloc/forgot_pass_event.dart';
part 'bloc/forgot_pass_state.dart';
part 'pages/forgot_pass_page.dart';
part 'widgets/email_form.dart';
part 'widgets/verify_code_form.dart';
