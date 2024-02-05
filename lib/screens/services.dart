import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../components/services_panel2.dart';
import '../components/services_panel3.dart';
import '../components/services_panel4.dart';
import '../components/services_panel5.dart';
import '../pages/all_services.dart';
import '../utils/colors.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen>
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
              AllServices(),
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

class ServiceTabs extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final Color boxColor;
  final Color iconColor;
  final Color textColor;

  const ServiceTabs({
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
