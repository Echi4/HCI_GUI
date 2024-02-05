import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/custom_button.dart';

class TumePesaScreen extends StatefulWidget {
  const TumePesaScreen({super.key});

  @override
  State<TumePesaScreen> createState() => _TumePesaScreenState();
}

class _TumePesaScreenState extends State<TumePesaScreen> {
  final priceController = TextEditingController();
  final phoneController = TextEditingController();
  late int tappedIndex;

  String? priceValue;

  List<Map> price = [
    {"id": 1, "value": "5,000"},
    {"id": 2, "value": "10,000"},
    {"id": 3, "value": "20,000"},
    {"id": 4, "value": "30,000"}
  ];
  void setValue(String value) {
    setState(() {
      priceValue = value;
      priceController.text = priceValue!;
    });
  }

  @override
  void initState() {
    super.initState();
    tappedIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
    priceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 120,
        child: Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Stack(
                // alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Namba yangu"),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.grey, width: 1)),
                                  child: TextFormField(
                                    controller: phoneController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 5, bottom: 5, top: 5, right: 5),
                                    ),
                                  )),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(0)),
                                  color: Colors.black54),
                              child: IconButton(
                                icon: const Icon(Icons.person),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Positioned(
                    top: 80,
                    right: 0,
                    left: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Kiasi"),
                        const SizedBox(height: 5),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.grey, width: 1)),
                            child: TextFormField(
                              controller: priceController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 5, bottom: 5, top: 5, right: 5),
                              ),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Positioned(
                    top: 165,
                    right: 0,
                    left: 0,
                    child: SizedBox(
                      height: 80,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: price.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  String selectedElement =
                                      price.elementAt(index)['value'];
                                  setValue(selectedElement);
                                  setState(() {
                                    tappedIndex = index;
                                  });
                                },
                                child: Container(
                                    width: 68,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: tappedIndex == index
                                                ? AppColors.primaryColor
                                                : Colors.grey,
                                            width: 2)),
                                    child: Center(
                                      child: Text(price[index]['value'],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                          textAlign: TextAlign.center),
                                    ))),
                          );
                        }),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 200),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(tap: () {}, text: "Endelea"))
                ],
              ),
            )),
      ),
    );
  }
}
