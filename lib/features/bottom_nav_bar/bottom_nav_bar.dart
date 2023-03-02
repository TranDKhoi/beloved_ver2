import 'package:beloved_ver2/utils/extensions/translate_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/colors.dart';
import '../../configs/langs/r.dart';
import '../home/presentation/home.dart';
import 'bottom_nav_bar_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  final List<Widget> pages = const [
    HomePage(),
    CalendarPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return Scaffold(
            body: pages[state.props[0] as int],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (i) => context.read<BottomNavBarCubit>().changePage(i),
              currentIndex: state.props[0] as int,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 10,
              selectedItemColor: AppColor.primaryColor,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home_filled),
                  label: R.timeline.translate,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.calendar_month_rounded),
                  label: R.calendar.translate,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.grid_view_rounded),
                  label: R.more.translate,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
