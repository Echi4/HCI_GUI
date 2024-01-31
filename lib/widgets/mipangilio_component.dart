import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MipangilioUI extends StatelessWidget {
  final String title;
  final List<MipangilioTile> tile;
  const MipangilioUI({
    Key? key,
    this.title = '',
    required this.tile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.055,
              width: MediaQuery.of(context).size.width * 1.0,
              color: Colors.grey[300],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              )),
          ...tile
        ]);
  }
}

class MipangilioTile extends StatelessWidget {
  final IconData icon;
  final String tileTitle;
  final Color titleColor;

  const MipangilioTile({
    Key? key,
    required this.icon,
    required this.tileTitle,
    this.titleColor = Colors.black87,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        tileTitle,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w400, color: titleColor),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, color: AppColors.primaryColor),
    );
  }
}
