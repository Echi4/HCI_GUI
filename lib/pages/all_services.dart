import 'package:flutter/material.dart';

import '../components/services_grid.dart';
import '../components/all_services_panel.dart';

class AllServices extends StatefulWidget {
  const AllServices({super.key});

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: const [
          SizedBox(height: 5),
          AllServicesPanel(),
          SizedBox(height: 10),
          Text(
            "Discover",
            style: TextStyle(
                fontWeight: FontWeight.w500, letterSpacing: 0.8, fontSize: 18),
          ),
          ServicesGrid()
        ],
      ),
    );
  }
}
