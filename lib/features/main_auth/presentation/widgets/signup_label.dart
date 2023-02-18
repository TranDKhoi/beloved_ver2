import 'package:beloved_ver2/utils/extensions/translate_extension.dart';
import 'package:flutter/material.dart';

import '../../../../configs/langs/r.dart';

class SignupLabel extends StatelessWidget {
  const SignupLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: InkWell(
        onTap: () {
          // navigatorKey.currentState?.pushNamed(signUpScreen);
        },
        child: Align(
          alignment: Alignment.center,
          child: Text(
            R.sign_up.translate,
          ),
        ),
      ),
    );
  }
}
