import 'package:flutter/material.dart';

import '../data/gundua.dart';

class HudumaZotePanel extends StatelessWidget {
  const HudumaZotePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: hudumaZote.take(4).length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.42,
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Material(
                    elevation: 6,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image:
                                  ExactAssetImage(hudumaZote[index]['image']),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image:
                              ExactAssetImage(hudumaZote[index]['secondary']),
                          fit: BoxFit.fill,
                        )),
                  ),
                )
              ]),
            ),
          );
        }),
      ),
    );
  }
}
