import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../data/home_data.dart';

class ToaPesaPanel extends StatelessWidget {
  const ToaPesaPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: homedata1.length,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Card(
                      color:Colors.red,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(homedata1[index]['icon'],color: Colors.white,),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      width:70,
                        child: Center(child: Text(homedata1[index]['name']))),
                  ),
                )
              ],
            );
          })),
    );
  }
}
