import 'package:flutter/material.dart';



class ServiceTabs extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final Color boxColor;
  final Color iconColor;
  final Color textColor;

  const ServiceTabs({
    Key? key,
    required this.title,
    required this.color,
    required this.icon,
    required this.boxColor,
    required this.iconColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Container(
            decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 1, color: color)),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(icon, size: 18, color: iconColor),
                  const SizedBox(width: 5),
                  Text(
                    title,
                    style: TextStyle(fontSize: 12, color: textColor),
                  ),
                ],
              ),
            )));
  }
}