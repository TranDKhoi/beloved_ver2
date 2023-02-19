import 'package:beloved_ver2/configs/dimens.dart';
import 'package:flutter/material.dart';

import '../configs/colors.dart';

class MLabelButton extends StatelessWidget {
  const MLabelButton(
      {Key? key,
      required this.onTap,
      this.text,
      this.isAccept = false,
      this.icon})
      : super(key: key);

  final VoidCallback onTap;
  final String? text;
  final bool isAccept;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: InkWell(
        onTap: onTap,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  size: 20,
                  color: isAccept ? AppColor.primaryColor : null,
                ),
              if (icon != null)
                const SizedBox(width: AppDimens.SIZED_SPACING * 0.5),
              Text(
                text ?? "",
                style: isAccept
                    ? const TextStyle(color: AppColor.primaryColor)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
