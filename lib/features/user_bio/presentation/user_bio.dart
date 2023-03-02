library user_bio;

import 'dart:async';

import 'package:beloved_ver2/commons/m_icon_text_button.dart';
import 'package:beloved_ver2/commons/m_input_field.dart';
import 'package:beloved_ver2/commons/m_label_button.dart';
import 'package:beloved_ver2/configs/dimens.dart';
import 'package:beloved_ver2/di/service_locator.dart';
import 'package:beloved_ver2/utils/exception_util.dart';
import 'package:beloved_ver2/utils/extensions/context_extension.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';
import 'package:beloved_ver2/utils/format_util.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/colors.dart';
import '../../../configs/langs/r.dart';
import '../../../configs/styles.dart';
import '../../../global/variable.dart';
import '../../../utils/alert_util.dart';
import '../domain/entities/create_user_bio.dart';
import '../domain/use_cases/user_bio_usecase.dart';

part 'bloc/user_bio_bloc.dart';
part 'bloc/user_bio_event.dart';
part 'bloc/user_bio_state.dart';
part 'pages/user_bio_page.dart';
part 'widgets/bio_form.dart';
