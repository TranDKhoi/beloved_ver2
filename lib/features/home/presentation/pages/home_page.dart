part of home;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceLocator.sl<HomeBloc>()..add(InitEvent()),
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const Icon(Icons.menu_outlined),
              );
            },
          ),
          title: const Text(
            "Beloved",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        drawer: const HomeSideBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              //HEADER
              const HomeHeader(),
              //TIMELINE
              if (GlobalVariable.currentUser!.partner != null)
                const MorePostButton(),
              const TimeLine(),
            ],
          ),
        ),
        floatingActionButton: GlobalVariable.currentUser!.partner != null
            ? FloatingActionButton(
                onPressed: () {
                  // NavigationUtil.push(page: ChatPage());
                },
                child: const Icon(Icons.chat_bubble_outline),
              )
            : null,
      ),
    );
  }
}

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("2"),
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("3"),
      ),
    );
  }
}
