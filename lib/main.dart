import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mpesa_ui/utils/colors.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mpesa UI',
      theme: ThemeData(
        primarySwatch: Colors.red,
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black45,
          labelStyle: TextStyle(color: Colors.black45), // color for text
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: AppColors.primaryColor),
          ),
        ),
        // primaryColor: Colors.pink[800], // outdated and has no effect to Tabbar
        // accentColor: Colors.cyan[600] // deprecated,
      ),
      home: const MainScreen(),
    );
  }
}
