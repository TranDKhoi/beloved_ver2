part of home;

class TimeLine extends StatelessWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadedState) {
          return Column(children: []
              // state.posts.map((e) => PostItem(item: e)).toList(),
              );
        }
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if (state is LoadedState) {
              return state.currentMode == ThemeMode.dark
                  ? Image.asset("assets/images/empty_dark.png")
                  : Image.asset("assets/images/empty.png");
            }
            return Image.asset("assets/images/empty.png");
          },
        );
      },
    );
  }
}
