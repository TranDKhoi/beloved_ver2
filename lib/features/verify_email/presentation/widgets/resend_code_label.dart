part of verify_email;

class ResendCodeLabel extends StatelessWidget {
  const ResendCodeLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          R.didntreceiveanycode.translate,
          textAlign: TextAlign.center,
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
        const SizedBox(width: AppDimens.SIZED_SPACING * 0.5),
        GestureDetector(
          onTap: () {},
          child: Text(
            R.resend.translate,
            textAlign: TextAlign.center,
            style: AppStyle.underlineBlueNormal,
          ),
        ),
      ],
    );
  }
}
