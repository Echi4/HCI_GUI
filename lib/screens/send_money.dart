import 'package:flutter/material.dart';
import 'package:mpesa_ui/data/home_data.dart';

import '../utils/colors.dart';

class MoveMoneyScreen extends StatefulWidget {
  const MoveMoneyScreen({super.key});

  @override
  State<MoveMoneyScreen> createState() => _MoveMoneyScreenState();
}

class _MoveMoneyScreenState extends State<MoveMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text("Move Money"),
      ),
      body: ListView.builder(
          itemExtent: 80.0,
          itemCount: sendmoneydata.length,
          itemBuilder: ((context, index) {
            return ListTile(
              leading: Icon(sendmoneydata[index]['icon'], color: Colors.grey),
              title: Text(
                sendmoneydata[index]['name'],
                style: TextStyle(fontSize: 20),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: AppColors.primaryColor),
            );
          })),
    );
  }
}
