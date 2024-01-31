import 'package:flutter/material.dart';

import '../components/gridViewHudumaZote.dart';
import '../components/hudumazotepanel.dart';

class HudumaZote extends StatefulWidget {
  const HudumaZote({super.key});

  @override
  State<HudumaZote> createState() => _HudumaZoteState();
}

class _HudumaZoteState extends State<HudumaZote> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: const [
          SizedBox(height: 5),
          HudumaZotePanel(),
          SizedBox(height: 10),
          Text(
            "Gundua",
            style: TextStyle(
                fontWeight: FontWeight.w500, letterSpacing: 0.8, fontSize: 18),
          ),
          GHudumaZotePanel()
        ],
      ),
    );
  }
}
