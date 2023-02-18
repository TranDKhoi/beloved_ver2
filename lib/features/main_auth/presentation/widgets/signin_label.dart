import 'package:beloved_ver2/utils/extensions/translate_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/langs/r.dart';
import '../../../login/presentation/login.dart';

class SignInLabel extends StatelessWidget {
  const SignInLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) {
                return BlocProvider.value(
                  value: context.read<LoginBloc>(),
                  child: const LoginForm(),
                );
              });
        },
        child: Align(
          alignment: Alignment.center,
          child: Text(
            R.login.translate,
            style: const TextStyle(color: AppColor.primaryColor),
          ),
        ),
      ),
    );
  }
}
