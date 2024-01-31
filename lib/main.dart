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
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'M-Pesa Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w400)
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black45,
          labelStyle: const TextStyle(color: Colors.black45), // color for text
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: AppColors.primaryColor),
          ),
        ),
      ),
      home: const MainScreen(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
    );
  }
}
