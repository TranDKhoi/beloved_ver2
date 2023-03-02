library verify_email;

import 'dart:async';

import 'package:beloved_ver2/commons/m_pincode_field.dart';
import 'package:beloved_ver2/configs/dimens.dart';
import 'package:beloved_ver2/di/service_locator.dart';
import 'package:beloved_ver2/features/user_bio/presentation/user_bio.dart';
import 'package:beloved_ver2/features/verify_email/domain/entities/verify_email_entity.dart';
import 'package:beloved_ver2/features/verify_email/domain/use_cases/verify_email_usecase.dart';
import 'package:beloved_ver2/global/variable.dart';
import 'package:beloved_ver2/utils/alert_util.dart';
import 'package:beloved_ver2/utils/exception_util.dart';
import 'package:beloved_ver2/utils/extensions/context_extension.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../commons/m_label_button.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/langs/r.dart';
import '../../../../configs/styles.dart';
import '../../../../utils/navigation_util.dart';

part 'bloc/verify_email_bloc.dart';
part 'bloc/verify_email_event.dart';
part 'bloc/verify_email_state.dart';
part 'pages/verify_email_page.dart';
part 'widgets/resend_code_label.dart';
