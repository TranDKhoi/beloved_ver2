part of reset_pass;

class ResetForm extends StatelessWidget {
  const ResetForm({
    Key? key,
    required this.passController,
    required this.rePassController,
  }) : super(key: key);

  final TextEditingController passController;
  final TextEditingController rePassController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MInputField(
          hintText: R.enteryourpassword.translate,
          suffixIcon: const Icon(Icons.lock_outline_rounded),
          controller: passController,
          isPassword: true,
        ),
        const SizedBox(height: AppDimens.SIZED_SPACING * 1.5),
        MInputField(
          hintText: R.enteryourpassword.translate,
          suffixIcon: const Icon(Icons.lock_outline_rounded),
          controller: rePassController,
          isPassword: true,
        ),
      ],
    );
  }
}
