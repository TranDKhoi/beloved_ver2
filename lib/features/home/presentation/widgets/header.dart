part of home;

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenSize.height / 2.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset("assets/images/timeline_wallpaper.jpg").image,
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.SCREEN_PADDING),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //total day
                Row(
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is HomeLoadedState) {
                          return Text(
                            FormatUtil.countDay(state.ourDay),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              height: 1,
                            ),
                          );
                        }
                        return const Text(
                          "0",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            height: 1,
                          ),
                        );
                      },
                    ),
                    Text(
                      R.days.translate,
                      style: const TextStyle(
                        color: Colors.white,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                // our name here
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        GlobalVariable.currentUser!.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.heart_broken,
                          color: Colors.white,
                        ),
                      ),
                      BlocBuilder<HomeBloc, HomeState>(
                        buildWhen: (prev, after) {
                          if (prev != after) return true;
                          if (prev is HomeLoadedState &&
                              after is HomeLoadedState) {
                            if (prev.partnerName != after.partnerName) {
                              return true;
                            }
                          }
                          return false;
                        },
                        builder: (context, state) {
                          if (state is HomeLoadedState) {
                            return Text(state.partnerName,
                                style: AppStyle.whiteBoldTitle);
                          }
                          return const Text("...",
                              style: AppStyle.whiteBoldTitle);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
