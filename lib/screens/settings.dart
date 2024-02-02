import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:local_auth/local_auth.dart';

import '../utils/colors.dart';
import '../widgets/services_component.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  bool? userHasTouchId;
  final storage = const FlutterSecureStorage();

  void getSecureStorage() async {
    final isUsingBio = await storage.read(key: 'usingBiometric');
    setState(() {
      userHasTouchId = isUsingBio == 'true';
    });

    if (!userHasTouchId!) {
      await authenticate();
    }
  }

  authenticate() async {
    final canCheck = await auth.canCheckBiometrics;
    if (canCheck) {
      List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();

      if (Platform.isIOS) {
        if (availableBiometrics.contains(BiometricType.face)) {
          final authenticated = await auth.authenticate(
              localizedReason: 'Enable Face ID to sign in more easily');
          if (authenticated) {
            storage.write(key: 'user_pin', value: '1234');
            storage.write(key: 'usingBiometric', value: 'true');
          }
        } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
          final authenticated = await auth.authenticate(
              localizedReason: 'Enable Touch ID to sign in more easily');
          if (authenticated) {
            storage.write(key: 'user_pin', value: '1234');
            storage.write(key: 'usingBiometric', value: 'true');
          }
        } else {
          final authenticated = await auth.authenticate(
              localizedReason: 'Enable Authentication to sign in more easily');
          if (authenticated) {
            storage.write(key: 'user_pin', value: '1234');
            storage.write(key: 'usingBiometric', value: 'true');
          }
        }
      } else {
        if (availableBiometrics.contains(BiometricType.face)) {
          final authenticated = await auth.authenticate(
              localizedReason: 'Enable Face ID to sign in more easily');
          if (authenticated) {
            storage.write(key: 'user_pin', value: '1234');
            storage.write(key: 'usingBiometric', value: 'true');
          }
        } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
          final authenticated = await auth.authenticate(
              localizedReason: 'Enable Touch ID to sign in more easily');
          if (authenticated) {
            storage.write(key: 'user_pin', value: '1234');
            storage.write(key: 'usingBiometric', value: 'true');
          }
        } else {
          final authenticated = await auth.authenticate(
              localizedReason: 'Enable Authentication to sign in more easily');
          if (authenticated) {
            storage.write(key: 'user_pin', value: '1234');
            storage.write(key: 'usingBiometric', value: 'true');
          }
        }
      }
    } else {
      print('cant check');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: const Text("Settings")),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: ListView(
          children: [
            SettingsSection(title: "M-Pesa Account Details", tile: [
              SettingsContent(
                  icon: IconlyLight.profile, tileTitle: "My Account")
            ]),
            SettingsSection(title: "Campaigns", tile: [
              SettingsContent(
                  icon: Icons.person_add_alt, tileTitle: "Refer a Friend")
            ]),
            SettingsSection(title: "Customize home Screen", tile: [
              SettingsContent(
                  icon: IconlyLight.category, tileTitle: "Customize Menus")
            ]),
            SettingsSection(title: "Pangilia uvipendavyo", tile: [
              SettingsContent(
                  icon: FontAwesomeIcons.addressBook, tileTitle: "Contacts"),
              SettingsContent(icon: Icons.business, tileTitle: "Business"),
            ]),
            SettingsSection(title: "Account Settings", tile: [
              SettingsContent(
                  icon: FontAwesomeIcons.language, tileTitle: "Language"),
            ]),
            SettingsSection(
              title: "Login & Security",
              tile: [
                GestureDetector(
                    onTap: () {
                      getSecureStorage();
                    },
                    child: SettingsContent(
                        icon: FontAwesomeIcons.fingerprint,
                        tileTitle: "Face ID")),
                SettingsContent(
                    icon: CupertinoIcons.lock, tileTitle: "Fast Login"),
                SettingsContent(
                    icon: FontAwesomeIcons.simCard,
                    tileTitle: "Login Activity"),
                SettingsContent(
                    icon: Icons.pin_outlined, tileTitle: "Change PIN"),
              ],
            ),
            SettingsSection(title: "Help", tile: [
              SettingsContent(
                  icon: IconlyBold.call, tileTitle: "Contact Vodacom"),
              SettingsContent(
                  icon: Icons.help_outline_rounded, tileTitle: "FAQ"),
            ]),
            SettingsSection(title: "About", tile: [
              SettingsContent(icon: Icons.update, tileTitle: "Update"),
              SettingsContent(
                  icon: Icons.remove_red_eye_outlined, tileTitle: "Privacy"),
              SettingsContent(
                  icon: FontAwesomeIcons.file,
                  tileTitle: "Terms and Conditions"),
              SettingsContent(
                  icon: CupertinoIcons.creditcard, tileTitle: "M-Pesa Fees"),
            ]),
          ],
        ),
      ),
    );
  }
}
