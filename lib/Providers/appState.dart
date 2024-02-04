import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';

import '../screens/bundles.dart';
import '../screens/home.dart';
import '../screens/move_money.dart';
import '../screens/services.dart';
import '../screens/settings.dart';





class AppState with ChangeNotifier {
  int _bottomNavIndex = 0;
  int get bottomNavIndex => _bottomNavIndex;

  final List<BottomNavigationBarItem> _bottomNav = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(IconlyLight.home,size: 24,),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.coins,size: 24,),
      label: 'Buy Bundles',

    ),
    const BottomNavigationBarItem(
      icon: Icon(IconlyLight.send,size: 24,),
      label: 'Move Money',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.storefront,size: 24,),
      label: 'Services',
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconlyLight.setting,size: 24,),
      label: 'Settings',
    ),
  ];
  List<BottomNavigationBarItem> get bottomNav => _bottomNav;

  final List<Widget> _bottomNavPages = <Widget>[
    const HomePage(),
    const BuyBundlesScreen(),
    const MoveMoneyScreen(),
    const AllServicesScreen(),
    const SettingsScreen()
  ];

  List<Widget> get bottomNavPages => _bottomNavPages;

  final List<Widget> _bottomNavTitles = <Widget>[
    const Text('Items'),
    const Text('History'),
    const Text('Reports'),
  ];

  List<Widget> get bottomNavTitles => _bottomNavTitles;



  void setBottomNavIndex(int index) {
    _bottomNavIndex = index;
    notifyListeners();
  }

}
