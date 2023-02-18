part of login;

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(AppDimens.SCREEN_PADDING),
      content: Wrap(
        children: [
          Column(
            children: [
              //email
              MInputField(
                controller: _emailController,
                suffixIcon: const Icon(Icons.close),
                hintText: R.enteryouremail.translate,
              ),
              const SizedBox(height: AppDimens.SIZED_SPACING * 1.5),
              //password
              MInputField(
                controller: _passController,
                obscureText: true,
                suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                hintText: R.enteryourpassword.translate,
                isPassword: true,
              ),
              const Divider(
                color: AppColor.primaryColor,
                endIndent: 0,
                thickness: AppDimens.DIVIDER_THICKNESS,
              ),
              //login btn
              MLabelButton(
                onTap: () {
                  context.read<LoginBloc>().add(LoginButtonClickedEvent(
                      email: _emailController.text,
                      password: _passController.text));
                },
                text: R.login.translate,
                isAccept: true,
                icon: Icons.check_circle_outline_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
