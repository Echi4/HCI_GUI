import 'package:flutter/material.dart';

import '../components/services_grid.dart';
import '../components/all_services_panel.dart';

class AllServicesPanel extends StatefulWidget {
  const AllServicesPanel({super.key});

  @override
  State<AllServicesPanel> createState() => _AllServicesPanelState();
}

class _AllServicesPanelState extends State<AllServicesPanel> {
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
            "Discover",
            style: TextStyle(
                fontWeight: FontWeight.w500, letterSpacing: 0.8, fontSize: 18),
          ),
          GHudumaZotePanel()
        ],
      ),
    );
  }
}
