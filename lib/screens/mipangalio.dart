import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/mipangilio_component.dart';

class MipangilioScreen extends StatefulWidget {
  const MipangilioScreen({super.key});

  @override
  State<MipangilioScreen> createState() => _MipangilioScreenState();
}

class _MipangilioScreenState extends State<MipangilioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: const Text("Mipangilio")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView(
          children: const [
            MipangilioUI(title: "Taarifa za Akaunti ya M-Pesa", tile: [
              MipangilioTile(icon: Icons.person, tileTitle: "Akaunt Yangu")
            ]),
            MipangilioUI(title: "Kampeni", tile: [
              MipangilioTile(icon: Icons.person, tileTitle: "Mualike rafiki")
            ]),
            MipangilioUI(title: "Panga kibinafsi skirini", tile: [
              MipangilioTile(
                  icon: Icons.person, tileTitle: "Panga kibinafsi menyu")
            ]),
            MipangilioUI(title: "Pangilia uvipendavyo", tile: [
              MipangilioTile(icon: Icons.person, tileTitle: "Namba"),
              MipangilioTile(icon: Icons.person, tileTitle: "Biashara"),
            ]),
            MipangilioUI(tile: [
              MipangilioTile(icon: Icons.person, tileTitle: "Lugha"),
            ]),
            MipangilioUI(title: "Kuingia na ulinzi", tile: [
              MipangilioTile(
                  icon: Icons.person, tileTitle: "Shughuli ya kuingia"),
              MipangilioTile(icon: Icons.person, tileTitle: "Badilisha PIN"),
            ]),
            MipangilioUI(title: "Msaada", tile: [
              MipangilioTile(
                  icon: Icons.person, tileTitle: "Wasiliana na Vodacom"),
              MipangilioTile(
                  icon: Icons.person,
                  tileTitle: "Maswali yanaulizwa mara kwa mara"),
            ]),
            MipangilioUI(title: "Kuhusu", tile: [
              MipangilioTile(icon: Icons.person, tileTitle: "Sasisha/Apudeti"),
              MipangilioTile(icon: Icons.person, tileTitle: "Usiri"),
              MipangilioTile(
                  icon: Icons.person, tileTitle: "Vigezo na masharti"),
              MipangilioTile(icon: Icons.person, tileTitle: "Ada za M-Pesa"),
            ]),
            MipangilioUI(tile: [
              MipangilioTile(
                  titleColor: Colors.red,
                  icon: Icons.person,
                  tileTitle: "Toka Nje"),
            ]),
          ],
        ),
      ),
    );
  }
}
