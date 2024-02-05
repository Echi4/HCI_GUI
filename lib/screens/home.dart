import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mpesa_ui/data/home_data.dart';
import 'package:mpesa_ui/utils/colors.dart';

import '../components/discover_panel.dart';
import '../components/withdraw.dart';

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
                  const SizedBox(height: 18),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: height + 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 2, color: Colors.white)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SwitchListTile(
                            title: const Text(
                              'Akaunti ya M-Pesa',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                            value: _show,
                            onChanged: (bool value) {
                              setState(() {
                                _show = !_show;
                              });
                            },
                            activeColor: Colors.white,
                          ),
                          _show
                              ? const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Text(
                                    '500 TZS',
                                    style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Text(
                                    '*********',
                                    style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                        ]),
                  ),
                ],
              ),
            ),

            Container(),
            // Required some widget in between to float AppBar


          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(AppBar().preferredSize.height),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: const [
            WithdrawPanel(),
            SizedBox(height: 3),
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


            Text(
              "Discover",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.8,
                  fontSize: 18),
            ),
            DiscoverPanel()
          ],
        ),
      )),
    );
  }
}
