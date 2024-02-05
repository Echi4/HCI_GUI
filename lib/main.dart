import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mpesa_ui/utils/colors.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(const MpesaClone());
}

class MpesaClone extends StatelessWidget {
  const MpesaClone({super.key});

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
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w300)
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black45,
          labelStyle: TextStyle(color: Colors.black45), // color for text
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: AppColors.primaryColor),
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}
