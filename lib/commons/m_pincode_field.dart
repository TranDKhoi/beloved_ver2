import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../configs/colors.dart';

class MPinCodeField extends StatelessWidget {
  const MPinCodeField(
      {Key? key, required this.controller, required this.onComplete})
      : super(key: key);

  final TextEditingController controller;

  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.underline,
        fieldHeight: 50,
        fieldWidth: 40,
        inactiveColor: Colors.grey,
        selectedColor: AppColor.primaryColor,
        activeColor: AppColor.primaryColor,
      ),
      animationDuration: const Duration(milliseconds: 300),
      controller: controller,
      onCompleted: (v) => onComplete,
      beforeTextPaste: (text) {
        return false;
      },
      appContext: context,
      onChanged: (String value) {},
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
