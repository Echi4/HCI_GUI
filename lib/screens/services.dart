import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../components/services_grid.dart';
import '../components/services_panel2.dart';
import '../components/services_panel3.dart';
import '../components/services_panel4.dart';
import '../components/services_panel5.dart';
import '../pages/all_services.dart';
import '../utils/colors.dart';
import '../widgets/myservice_tabs.dart';

class AllServicesScreen extends StatefulWidget {
  const AllServicesScreen({super.key});

  @override
  State<AllServicesScreen> createState() => _AllServicesScreenState();
}

class _AllServicesScreenState extends State<AllServicesScreen>
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
          ServiceTabs(
              iconColor: _activeIndex == 0 ? Colors.white : Colors.grey,
              boxColor:
                  _activeIndex == 0 ? AppColors.primaryColor : Colors.white,
              textColor: _activeIndex == 0 ? Colors.white : Colors.grey,
              color: _activeIndex == 0 ? Colors.transparent : Colors.grey,
              icon: Icons.all_inbox,
              title: "All Services"),
          ServiceTabs(
              iconColor: _activeIndex == 1 ? Colors.white : Colors.grey,
              boxColor:
                  _activeIndex == 1 ? AppColors.primaryColor : Colors.white,
              textColor: _activeIndex == 1 ? Colors.white : Colors.grey,
              color: _activeIndex == 1 ? Colors.transparent : Colors.grey,
              icon: Icons.handshake_outlined,
              // some sort of hand begging for help
              title: "Loans and Savings"),
          ServiceTabs(
              iconColor: _activeIndex == 2 ? Colors.white : Colors.grey,
              boxColor:
                  _activeIndex == 2 ? AppColors.primaryColor : Colors.white,
              textColor: _activeIndex == 2 ? Colors.white : Colors.grey,
              color: _activeIndex == 2 ? Colors.transparent : Colors.grey,
              icon: Icons.account_balance,
              title: "Financial Services"),
          ServiceTabs(
              iconColor: _activeIndex == 3 ? Colors.white : Colors.grey,
              boxColor:
                  _activeIndex == 3 ? AppColors.primaryColor : Colors.white,
              textColor: _activeIndex == 3 ? Colors.white : Colors.grey,
              color: _activeIndex == 3 ? Colors.transparent : Colors.grey,
              icon: Icons.water_drop_outlined,
              title: "Utilities"),
          ServiceTabs(
              iconColor: _activeIndex == 4 ? Colors.white : Colors.grey,
              boxColor:
                  _activeIndex == 4 ? AppColors.primaryColor : Colors.white,
              textColor: _activeIndex == 4 ? Colors.white : Colors.grey,
              color: _activeIndex == 4 ? Colors.transparent : Colors.grey,
              icon: Icons.games,
              title: "Entertainment"),
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
          title: const Text("Services"),
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
              AllServicesPanel(),
              ServicesPanel2(),
              ServicesPanel3(),
              ServicesPanel4(),
              ServicesPanel5(),
            ],
          ),
        ),
      ),
    );
  }
}


