library signup;

import 'package:beloved_ver2/commons/m_input_field.dart';
import 'package:beloved_ver2/commons/m_label_button.dart';
import 'package:beloved_ver2/configs/dimens.dart';
import 'package:beloved_ver2/configs/styles.dart';
import 'package:beloved_ver2/di/service_locator.dart';
import 'package:beloved_ver2/features/signup/domain/use_cases/signup_usecase.dart';
import 'package:beloved_ver2/utils/extensions/context_extension.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';
import 'package:beloved_ver2/utils/navigation_util.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/langs/r.dart';
import '../../../utils/alert_util.dart';
import '../../../utils/exception_util.dart';
import '../../verify_email/presentation/verify_email.dart';
import '../domain/entities/confirm_entity.dart';

part 'bloc/signup_bloc.dart';
part 'bloc/signup_event.dart';
part 'bloc/signup_state.dart';
part 'pages/signup_page.dart';
part 'widgets/signup_form.dart';
