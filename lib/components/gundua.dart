import 'package:flutter/material.dart';

import '../data/gundua.dart';

class GunduaPanel extends StatelessWidget {
  const GunduaPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: gunduaData.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.44,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(gunduaData[index]['image'],
                            height: 50, width: 60, fit: BoxFit.cover),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(gunduaData[index]['title'],
                              overflow: TextOverflow.ellipsis),
                        )
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
