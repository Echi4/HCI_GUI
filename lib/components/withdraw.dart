import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mpesa_ui/pages/topup.dart';
import 'package:mpesa_ui/screens/send_money.dart';

import '../data/home_data.dart';

class TransactionPanel extends StatelessWidget {
  const TransactionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.13,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: homedata1.length,
            itemBuilder: ((context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if(index==0){
                        Navigator.push(context, MaterialPageRoute(builder:
                        (context)=>SendingMoneyScreen()));
                      }
                    },
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Card(
                        color: Colors.red.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(70)),
                        elevation: 0,
                        child: Icon(
                          homedata1[index]['icon'],
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: SizedBox(
                        width: 62,
                        child: Center(
                            child: Text(
                          homedata1[index]['name'],
                          style: TextStyle(fontSize: 12),
                        ))),
                  )
                ],
              );
            })),
      ),
    );
  }
}
