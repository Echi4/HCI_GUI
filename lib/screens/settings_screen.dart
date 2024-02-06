import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';

import '../utils/colors.dart';
import '../widgets/settings_component.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: const Text("Settings")),
      body: ListView(
        children: const [
          SettingsSection(title: "Akaunti Yako", tile: [
            SettingsContent(
                icon: Icons.person_2_rounded, tileTitle: "Akaunti Yangu"),
            SettingsContent(icon: Icons.language, tileTitle: "Badili Lugha"),
            // SettingsContent(
            //     icon: Icons.pin_outlined, tileTitle: "Badili Neno Siri"),
            // SettingsContent(
            //     icon: Icons.remove_red_eye_outlined, tileTitle: "Kumbukumbu"),
          ]),
          // SettingsSection(title: "Campaigns", tile: [
          //   SettingsContent(
          //       icon: Icons.person_add_alt, tileTitle: "Refer a Friend")
          // ]),
          // SettingsSection(title: "Customize home Screen", tile: [
          //   SettingsContent(
          //       icon: IconlyLight.category, tileTitle: "Customize Menus")
          // ]),
          SettingsSection(title: "Mpangilio", tile: [
            SettingsContent(icon: Icons.menu_rounded, tileTitle: "Menyu"),
            SettingsContent(icon: Icons.contacts_rounded, tileTitle: "Rafiki"),
            // SettingsContent(icon: Icons.business, tileTitle: "Business"),
          ]),
          // SettingsSection(title: "Account Settings", tile: [
          //   SettingsContent(
          //       icon: FontAwesomeIcons.language, tileTitle: "Language"),
          // ]),
          // SettingsSection(
          //   title: "Login & Security",
          //   tile: [
          //     SettingsContent(
          //         icon: FontAwesomeIcons.fingerprint, tileTitle: "Face ID"),
          //     SettingsContent(
          //         icon: CupertinoIcons.lock, tileTitle: "Fast Login"),
          //     SettingsContent(
          //         icon: FontAwesomeIcons.simCard,
          //         tileTitle: "Login Activity"),
          //     SettingsContent(
          //         icon: Icons.pin_outlined, tileTitle: "Change PIN"),
          //   ],
          // ),
          SettingsSection(title: "Msaada", tile: [
            SettingsContent(
              icon: Icons.phone,
              tileTitle: "Huduma Kwa Wateja",
            ),
            // SettingsContent(
            //     icon: Icons.help_outline_rounded, tileTitle: "FAQ"),
            // SettingsContent(
            //     icon: FontAwesomeIcons.file,
            //     tileTitle: "Terms and Conditions"),
          ]),
          // SettingsSection(title: "About", tile: [
          //   SettingsContent(icon: Icons.update, tileTitle: "Update"),
          //   SettingsContent(
          //       icon: Icons.remove_red_eye_outlined, tileTitle: "Privacy"),
          //   SettingsContent(
          //       icon: FontAwesomeIcons.file,
          //       tileTitle: "Terms and Conditions"),
          //   SettingsContent(
          //       icon: CupertinoIcons.creditcard, tileTitle: "M-Pesa Fees"),
          // ]),
        ],
      ),
    );
  }
}
