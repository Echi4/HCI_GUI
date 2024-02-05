import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/custom_button.dart';

class NunuaBandoScreen extends StatefulWidget {
  const NunuaBandoScreen({super.key});

  @override
  State<NunuaBandoScreen> createState() => _NunuaBandoScreenState();
}

class _NunuaBandoScreenState extends State<NunuaBandoScreen> {
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
