part of home_side_bar;

class HomeSideBar extends StatelessWidget {
  const HomeSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: AppColor.primaryColor,
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: AppDimens.SIZED_SPACING * 2),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: AppDimens.SIZED_SPACING),
                        Text(
                          R.since.translate,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            if (state is HomeLoadedState) {
                              return Text(
                                FormatUtil.toShortDate(state.ourDay),
                              );
                            }
                            return const Text(
                              "0",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: AppDimens.SIZED_SPACING),
                        GestureDetector(
                          onTap: () async {
                            if (GlobalVariable.currentUser?.partner == null) {
                              return;
                            }
                            await showDatePicker(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BlocBuilder<HomeBloc, HomeState>(
                                  builder: (context, state) {
                                    if (state is HomeLoadedState) {
                                      return Text(
                                        FormatUtil.countDay(DateTime.now()),
                                        style: const TextStyle(
                                          fontSize: 30,
                                          color: AppColor.primaryColor,
                                        ),
                                      );
                                    }
                                    return Text(
                                      FormatUtil.countDay(DateTime.now()),
                                      style: const TextStyle(
                                        fontSize: 30,
                                        color: AppColor.primaryColor,
                                      ),
                                    );
                                  },
                                ),
                                Text(
                                  R.days.translate,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      right: AppDimens.SIZED_SPACING,
                      child: GestureDetector(
                        onTap: () {
                          // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return const AddAnniversaryForm();
                          //     });
                        },
                        child: const Icon(Icons.create_outlined),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoadedState) {
                  return Expanded(
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (c, i) => Center(),
                        // AnniversaryItem(item: snap.data![i]),
                        separatorBuilder: (c1, index) => const Divider(),
                        itemCount: state.anniversaries.length),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  showDatePicker(context) async {
    return await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return SizedBox(
          height: context.screenSize.height / 3,
          child: CupertinoDatePicker(
            backgroundColor: Colors.grey,
            initialDateTime: DateTime.now(),
            maximumDate: DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime value) {},
          ),
        );
      },
    );
  }
}
