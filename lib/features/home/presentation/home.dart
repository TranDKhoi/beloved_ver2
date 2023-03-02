library home;

import 'dart:async';

import 'package:beloved_ver2/configs/dimens.dart';
import 'package:beloved_ver2/di/service_locator.dart';
import 'package:beloved_ver2/features/home_side_bar/home_side_bar.dart';
import 'package:beloved_ver2/global/variable.dart';
import 'package:beloved_ver2/utils/exception_util.dart';
import 'package:beloved_ver2/utils/extensions/context_extension.dart';
import 'package:beloved_ver2/utils/extensions/translate_extension.dart';
import 'package:beloved_ver2/utils/format_util.dart';
import 'package:beloved_ver2/utils/navigation_util.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/colors.dart';
import '../../../configs/langs/r.dart';
import '../../../configs/styles.dart';
import '../../app/presentation/bloc/app_bloc.dart';
import '../domain/use_cases/home_usecase.dart';

part 'bloc/home_bloc.dart';
part 'bloc/home_event.dart';
part 'bloc/home_state.dart';
part 'pages/home_page.dart';
part 'widgets/add_post_form.dart';
part 'widgets/header.dart';
part 'widgets/more_post_button.dart';
part 'widgets/timeline.dart';
