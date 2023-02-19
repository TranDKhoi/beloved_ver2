part of signup;

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key? key,
    required this.emailController,
    required this.passController,
    required this.rePassController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController rePassController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MInputField(
          hintText: R.enteryouremail.translate,
          suffixIcon: const Icon(Icons.close),
          controller: emailController,
        ),
        const SizedBox(height: AppDimens.SIZED_SPACING * 1.5),
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
