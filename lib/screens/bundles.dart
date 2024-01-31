import 'package:flutter/material.dart';
import 'package:mpesa_ui/utils/colors.dart';

import '../pages/buy_bundle.dart';
import '../pages/topup.dart';

class BuyBundlesScreen extends StatefulWidget {
  const BuyBundlesScreen({super.key});

  @override
  State<BuyBundlesScreen> createState() => _BuyBundlesScreenState();
}

class _BuyBundlesScreenState extends State<BuyBundlesScreen> {
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
          title: const Text("Buy Bundles"),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(color: Colors.white, child: _tabBar),
          ),
        ),
        body: const TabBarView(
          children: [SendMoneyScreen(), BundlesScreen()],
        ),
      ),
    );
  }
}
