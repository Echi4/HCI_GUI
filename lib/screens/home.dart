import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:mpesa_ui/data/home_data.dart';
import 'package:mpesa_ui/utils/colors.dart';

import '../components/services_panel.dart';
import '../components/toapesa.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _show = false;
  _appBar(height) => PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, height + 192),
        child: Column(
          children: [
            Container(
              // Background
              color: AppColors.primaryColor,
              height: height + 215,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: const Text(
                          "Hello Juma",
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),


          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.red.shade900,
        title: Text(
          "Hello Juma",
          style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        actions: [
          Icon(CupertinoIcons.bell,color: Colors.white,size: 34,weight: 1,),
          Icon(CupertinoIcons.qrcode_viewfinder,color: Colors.white,size: 34,weight: 1,),
          SizedBox(width: 10,)
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children:  [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.red.shade900,
                border: Border.fromBorderSide(BorderSide.none)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('M-Pesa account',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 16),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(!_show?'Amount':'TZS 7,200',style: TextStyle(color: Colors.white,fontWeight:_show?FontWeight.w800: FontWeight.w400,fontSize:_show?18 :16)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 150,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white)
                          ),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                _show=!_show;
                              });
                            },
                            child: Center(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(!_show?CupertinoIcons.eye:CupertinoIcons.eye_slash,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text(!_show?'Show Balance':'Hide Balance',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 12)),
                              ],
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
                ]),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TransactionPanel(),
                  const SizedBox(height: 3),
                  SizedBox(
                    height: 70,
                    child: Material(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(color: Colors.black12,width: 2)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.receipt),
                            Center(child: Text("M-Pesa Statements",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17),)),
                            Icon(Icons.arrow_forward_ios,
                                color: AppColors.primaryColor)

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Suggested Services for you",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.8,
                          fontSize: 18),
                    ),
                  ),
                  const ServicesPanel(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
