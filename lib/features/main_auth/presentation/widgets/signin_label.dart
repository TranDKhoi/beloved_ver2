part of main_auth;

class SignInLabel extends StatelessWidget {
  const SignInLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MLabelButton(
      onTap: () =>
          showDialog(context: context, builder: (_) => const LoginForm()),
      text: R.login.translate,
      isAccept: true,
    );
  }
}
