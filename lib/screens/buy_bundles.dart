import 'package:flutter/material.dart';
import 'package:mpesa_ui/utils/colors.dart';

import '../pages/buy_bundle.dart';
import '../pages/topup.dart';

class BuyBundleScreen extends StatefulWidget {
  const BuyBundleScreen({super.key});

  @override
  State<BuyBundleScreen> createState() => _BuyBundleScreenState();
}

class _BuyBundleScreenState extends State<BuyBundleScreen> {
  TabBar get _tabBar => const TabBar(
        tabs: [
          Tab(text: "Single Top up"),
          Tab(text: "Bundle"),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: const Text("Buy Bundle"),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(color: Colors.white, child: _tabBar),
          ),
        ),
        body: const TabBarView(
          children: [SendMoneyTab(), BuyBundleTab()],
        ),
      ),
    );
  }
}
