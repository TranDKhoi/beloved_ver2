part of main_auth;

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/login_wallpaper.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(height: context.screenSize.height / 10),
              Image.asset(
                "assets/images/logo.png",
                width: context.screenSize.height * 0.15,
                height: context.screenSize.height * 0.15,
              ),
              const Text(
                "Beloved",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
