import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../Providers/appState.dart';
import '../services/assets_manager.dart';
import 'chat_screen.dart';
import 'home.dart';
import 'services.dart';
import 'settings.dart';
import 'bundles.dart';
import 'move_money.dart';
import '../utils/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Widget> _pages;
  int _selectedIndex = 0;
  double bottomBarWidth = 30;
  double bottomBarBorderWidth = 3;
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  AppState? appState;


  void _onItemTapped(int index) {
    Provider.of<AppState>(context,listen: false).setBottomNavIndex(index);
  }

  @override
  void initState() {
    super.initState();



    _pages = [
      const HomePage(),
      const BuyBundlesScreen(),
      const MoveMoneyScreen(),
      const AllServicesScreen(),
      const SettingsScreen()
    ];
  }

  @override
  void didChangeDependencies() {
    appState = Provider.of<AppState>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: appState!.bottomNavIndex, children: appState!.bottomNavPages),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home,size: 24,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.coins,size: 24,),
            label: 'Buy Bundles',

          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.send,size: 24,),
            label: 'Move Money',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront,size: 24,),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.setting,size: 24,),
            label: 'Settings',
          ),
        ],
        currentIndex: appState!.bottomNavIndex, //New
        onTap: _onItemTapped,
        iconSize: 24,
        selectedFontSize: 13.0,
        unselectedFontSize: 12.0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        backgroundColor: Colors.grey[200],
        // type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        // selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: const IconThemeData(color: Colors.black54),
        unselectedItemColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        double height = MediaQuery.of(context).size.height*0.85;
        showModalBottomSheet(
          isDismissible: false,
            isScrollControlled: true,
            context: context,
            builder: (context)=>Container(
          width: MediaQuery.of(context).size.width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14)),
            color: Colors.white
          ),
              child: const ChatScreen(),
        ));
      },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: Colors.red.shade900,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
            child: Image.asset(AssetsManager.openaiLogo2)),),
    );
  }
}
