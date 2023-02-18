import 'package:flutter/material.dart';

import '../configs/colors.dart';
import '../configs/dimens.dart';
import '../configs/styles.dart';

class MLabelButton extends StatelessWidget {
  const MLabelButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.text,
    this.isAccept = false,
  }) : super(key: key);

  final VoidCallback onTap;
  final String? text;
  final bool isAccept;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: AppDimens.SIZED_SPACING * 0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isAccept ? AppColor.primaryColor : null,
            ),
            const SizedBox(width: AppDimens.SIZED_SPACING * 0.5),
            Text(
              text ?? "",
              style: isAccept ? AppStyle.pinkBoldStyle : null,
            ),
          ],
        ),
      ),
    );
  }
}
