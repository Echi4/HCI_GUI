import 'package:flutter/material.dart';

import '../data/discover.dart';

class ServicesPanel extends StatelessWidget {
  const ServicesPanel({super.key});

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
                child: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)
                  ),
                  color: Colors.white,
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(discoverData[index]['image'],
                            height: 90, width: 90, fit: BoxFit.cover),
                        // const SizedBox(width: 10),
                        // Expanded(
                        //   child: Text(gunduaData[index]['title'],
                        //       overflow: TextOverflow.fade),
                        // )
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
