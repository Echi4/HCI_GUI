import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../components/gridViewHudumaZote.dart';
import '../components/huduma_zote2.dart';
import '../components/huduma_zote3.dart';
import '../components/huduma_zote4.dart';
import '../components/huduma_zote5.dart';
import '../pages/huduma_zote.dart';
import '../utils/colors.dart';

class HudumaScreen extends StatefulWidget {
  const HudumaScreen({super.key});

  @override
  State<HudumaScreen> createState() => _HudumaScreenState();
}

class _HudumaScreenState extends State<HudumaScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _activeIndex = 0;

  TabBar get _tabBar => TabBar(
        controller: _tabController,
        isScrollable: true,
        indicatorColor: Colors.transparent,
        onTap: (tabIndex) {
          setState(() {
            _activeIndex = tabIndex;
          });
        },
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white38)),
        tabs: [
          HudumaTabs(
              iconColor: _activeIndex == 0 ? Colors.white : Colors.grey,
              boxColor:
                  _activeIndex == 0 ? AppColors.primaryColor : Colors.white,
              textColor: _activeIndex == 0 ? Colors.white : Colors.grey,
              color: _activeIndex == 0 ? Colors.transparent : Colors.grey,
              icon: Icons.all_inbox,
              title: "Huduma zote"),
          HudumaTabs(
              iconColor: _activeIndex == 1 ? Colors.white : Colors.grey,
              boxColor:
                  _activeIndex == 1 ? AppColors.primaryColor : Colors.white,
              textColor: _activeIndex == 1 ? Colors.white : Colors.grey,
              color: _activeIndex == 1 ? Colors.transparent : Colors.grey,
              icon: Icons.handshake_outlined,
              // some sort of hand begging for help
              title: "Mikopo na Akiba"),
          HudumaTabs(
              iconColor: _activeIndex == 2 ? Colors.white : Colors.grey,
              boxColor:
                  _activeIndex == 2 ? AppColors.primaryColor : Colors.white,
              textColor: _activeIndex == 2 ? Colors.white : Colors.grey,
              color: _activeIndex == 2 ? Colors.transparent : Colors.grey,
              icon: Icons.account_balance,
              title: "Huduma za Kifedha"),
          HudumaTabs(
              iconColor: _activeIndex == 3 ? Colors.white : Colors.grey,
              boxColor:
                  _activeIndex == 3 ? AppColors.primaryColor : Colors.white,
              textColor: _activeIndex == 3 ? Colors.white : Colors.grey,
              color: _activeIndex == 3 ? Colors.transparent : Colors.grey,
              icon: Icons.water_drop_outlined,
              title: "Matumizi"),
          HudumaTabs(
              iconColor: _activeIndex == 4 ? Colors.white : Colors.grey,
              boxColor:
                  _activeIndex == 4 ? AppColors.primaryColor : Colors.white,
              textColor: _activeIndex == 4 ? Colors.white : Colors.grey,
              color: _activeIndex == 4 ? Colors.transparent : Colors.grey,
              icon: Icons.games,
              title: "Burudani"),
        ],
      );

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: 5, initialIndex: _activeIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController!.addListener(() {
      if (_tabController!.indexIsChanging) {
        setState(() {
          _activeIndex = _tabController!.index;
          // _tabController.animateTo(value);
        });
      }
    });
    return DefaultTabController(
      initialIndex: _activeIndex,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: const Text("Huduma"),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(color: Colors.white, child: _tabBar),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TabBarView(
            controller: _tabController,
            children: const [
              HudumaZote(),
              GHudumaZotePanel2(),
              GHudumaZotePanel3(),
              GHudumaZotePanel4(),
              GHudumaZotePanel5(),
            ],
          ),
        ),
      ),
    );
  }
}

class HudumaTabs extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final Color boxColor;
  final Color iconColor;
  final Color textColor;

  const HudumaTabs({
    Key? key,
    required this.title,
    required this.color,
    required this.icon,
    required this.boxColor,
    required this.iconColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Container(
            decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 2, color: color)),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(icon, size: 18, color: iconColor),
                  const SizedBox(width: 5),
                  Text(
                    title,
                    style: TextStyle(fontSize: 15, color: textColor),
                  ),
                ],
              ),
            )));
  }
}
