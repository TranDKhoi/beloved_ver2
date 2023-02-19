part of main_auth;

class SignupLabel extends StatelessWidget {
  const SignupLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MLabelButton(
      onTap: () {
        NavigationUtil.push(page: SignupPage());
      },
      text: R.sign_up.translate,
    );
  }
}
