import 'package:flutter/material.dart';

import '../data/discover.dart';

class DiscoverPanel extends StatelessWidget {
  const DiscoverPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Nunua Bando"), Text("TShs.2000")],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Nunua LUKU"), Text("Kiasi TShs. 3,000")],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tuma Pesa"),
                    Text("TShs.2000 kwenda kwa Asha")
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
