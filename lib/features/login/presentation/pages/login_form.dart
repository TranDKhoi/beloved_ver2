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
    return BlocProvider(
      create: (context) => ServiceLocator.sl<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is SuccessState) {
            // NavigationUtil.pushAndRemoveUntil(page: page);
          }
        },
        builder: (context, state) {
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
                    const SizedBox(height: AppDimens.SIZED_SPACING * 2),
                    //password
                    MInputField(
                      controller: _passController,
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      hintText: R.enteryourpassword.translate,
                      isPassword: true,
                    ),
                    const Divider(
                      color: AppColor.primaryColor,
                      height: AppDimens.SIZED_SPACING * 2,
                    ),
                    //login btn
                    MIconTextButton(
                      onTap: () {
                        context.read<LoginBloc>().add(LoginButtonClickedEvent(
                            email: _emailController.text,
                            password: _passController.text));
                      },
                      text: R.login.translate,
                      isAccept: true,
                      icon: Icons.check_circle_outline_rounded,
                    ),
                    const SizedBox(height: AppDimens.SIZED_SPACING * 1.5),
                    GestureDetector(
                      onTap: () => NavigationUtil.push(page: ForgotPassPage()),
                      child: Text(
                        R.forgotpassword.translate,
                        style: AppStyle.underlineBlueNormal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
