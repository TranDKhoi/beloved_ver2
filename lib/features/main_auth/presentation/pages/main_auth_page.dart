part of main_auth;

class MainAuthPage extends StatelessWidget {
  const MainAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //BACKGROUND
          const Background(),
          //BUTTON
          SizedBox(
            height: context.screenSize.height / 15,
            child: Row(
              children: const [
                SignupLabel(),
                VerticalDivider(width: 0),
                SignInLabel(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
