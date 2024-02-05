import 'package:flutter/material.dart';

import '../data/discover.dart';

class DiscoverPanel extends StatelessWidget {
  const DiscoverPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: discoverData.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.44,
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(discoverData[index]['image'],height: 90, width: 90, fit: BoxFit.cover),
                      ],
                    ),
                  ),
                ),
              ),
            );
          })),
    );
  }
}
