import 'package:flutter/material.dart';
import 'package:mpesa_ui/data/home_data.dart';

import '../utils/colors.dart';

class HamishaPesaScreen extends StatefulWidget {
  const HamishaPesaScreen({super.key});

  @override
  State<HamishaPesaScreen> createState() => _HamishaPesaScreenState();
}

class _HamishaPesaScreenState extends State<HamishaPesaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text("Hamisha Pesa"),
      ),
      body: ListView.builder(
          itemExtent: 80.0,
          itemCount: hamishapesadata.length,
          itemBuilder: ((context, index) {
            return ListTile(
              leading: Icon(hamishapesadata[index]['icon'], color: Colors.grey),
              title: Text(
                hamishapesadata[index]['name'],
                style: TextStyle(fontSize: 20),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: AppColors.primaryColor),
            );
          })),
    );
  }
}
