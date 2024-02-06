import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mpesa_ui/data/discover.dart';

import '../services/assets_manager.dart';
import 'chat_screen.dart';
import 'home.dart';
import 'services.dart';
import 'settings_screen.dart';
import 'buy_bundles.dart';
import 'send_money.dart';
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
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _pages = [
      const HomePage(),
      const BuyBundleScreen(),
      const MoveMoneyScreen(),
      const ChatScreen(),
      // const ServicesScreen(),
      const SettingsScreen()

      // const ViewCrops(),
      // const AddProduct(),
      // const AccountPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/home-angle-svgrepo-com.svg',
                width: 25.0,
                height: 25.0,
                color:
                    _selectedIndex == 0 ? AppColors.primaryColor : Colors.black,
              ),
              label: "Nyumbani"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/ticket-free-6-svgrepo-com.svg',
                width: 25.0,
                height: 25.0,
                color:
                    _selectedIndex == 1 ? AppColors.primaryColor : Colors.black,
              ),
              label: "Nunua Bando"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/wallet-send-svgrepo-com.svg',
                width: 25.0,
                height: 25.0,
                color:
                    _selectedIndex == 2 ? AppColors.primaryColor : Colors.black,
              ),
              label: "Tuma Pesa"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/support.svg',
                width: 25.0,
                height: 25.0,
              ),
              label: "Huduma Bot"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/settings-svgrepo-com.svg',
                width: 25.0,
                height: 25.0,
                color:
                    _selectedIndex == 3 ? AppColors.primaryColor : Colors.black,
              ),
              label: "Mpangilio"),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        iconSize: 30.0,
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     double height = MediaQuery.of(context).size.height * 0.85;
      //     showModalBottomSheet(
      //         isDismissible: false,
      //         isScrollControlled: true,
      //         context: context,
      //         builder: (context) => Container(
      //               width: MediaQuery.of(context).size.width,
      //               height: height,
      //               decoration: const BoxDecoration(
      //                   borderRadius: BorderRadius.only(
      //                       topLeft: Radius.circular(14),
      //                       topRight: Radius.circular(14)),
      //                   color: Colors.white),
      //               child: const ChatScreen(),
      //             ));
      //   },
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      //   backgroundColor: Colors.white,
      //   child: ClipRRect(
      //       borderRadius: BorderRadius.circular(2),
      //       child: Image.asset(AssetsManager.openaiLogo2)),
      // ),
    );
  }
}
