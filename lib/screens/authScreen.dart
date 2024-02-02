import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mpesa_ui/widgets/loaderDialog.dart';

import 'main_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController pin = TextEditingController();
  FocusNode pinFous = FocusNode();

  final LocalAuthentication auth = LocalAuthentication();
  bool? userHasTouchId;
  final storage = const FlutterSecureStorage();

  void getSecureStorage() async {
    final isUsingBio = await storage.read(key: 'usingBiometric');
    setState(() {
      userHasTouchId = isUsingBio == 'true';
    });

    if(userHasTouchId!){
      pinFous.unfocus();
      await localAuth();
    }
  }

  localAuth() async {
    final canCheck = await auth.canCheckBiometrics;

    if (canCheck) {
      List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();

      if (Platform.isIOS) {
        if (availableBiometrics.contains(BiometricType.face)) {
          // Face ID.
          final authenticated = await auth.authenticate(
            localizedReason: 'Enable Face ID to sign in more easily',
            options: const AuthenticationOptions(
              stickyAuth: true,
            ),
          );
          if (authenticated) {
            final staffStoredCode = await storage.read(key: 'user_pin');
            setState(() {
              pin = TextEditingController(text: staffStoredCode);
            });
            showDialog(
                context: context,
                builder: (context) => const LoaderDialog());
            Future.delayed(
                const Duration(
                  seconds: 2,
                ), () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainScreen()),
                      (route) => false);
            });
          }
        } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
          final authenticated = await auth.authenticate(
            localizedReason: 'Enable Touch ID to sign in more easily',
            options: const AuthenticationOptions(
              stickyAuth: true,
            ),
          );
          if (authenticated) {
            final staffStoredCode = await storage.read(key: 'user_pin');
            setState(() {
              pin = TextEditingController(text: staffStoredCode);
            });
            showDialog(
                context: context,
                builder: (context) => const LoaderDialog());
            Future.delayed(
                const Duration(
                  seconds: 2,
                ), () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainScreen()),
                      (route) => false);
            });
          }
        }
      } else {
        if (availableBiometrics.contains(BiometricType.face)) {
          // Face ID.
          final authenticated = await auth.authenticate(
            localizedReason: 'Enable Face ID to sign in more easily',
            options: const AuthenticationOptions(
              stickyAuth: true,
            ),
          );
          if (authenticated) {
            final staffStoredCode = await storage.read(key: 'user_pin');
            setState(() {
              pin = TextEditingController(text: staffStoredCode);
            });
            showDialog(
                context: context,
                builder: (context) => const LoaderDialog());
            Future.delayed(
                const Duration(
                  seconds: 2,
                ), () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainScreen()),
                      (route) => false);
            });
          }
        } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
          final authenticated = await auth.authenticate(
            localizedReason: 'Enable Touch ID to sign in more easily',
            options: const AuthenticationOptions(
              stickyAuth: true,
            ),
          );
          if (authenticated) {
            final staffStoredCode = await storage.read(key: 'user_pin');

            setState(() {
              pin = TextEditingController(text: staffStoredCode);
            });
            showDialog(
                context: context,
                builder: (context) => const LoaderDialog());
            Future.delayed(
                const Duration(
                  seconds: 2,
                ), () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainScreen()),
                      (route) => false);
            });
          }
        } else {
          final authenticated = await auth.authenticate(
            localizedReason: 'Enable Authentication to sign in more easily',
            options: const AuthenticationOptions(
              stickyAuth: true,
            ),
          );
          if (authenticated) {
            final staffStoredCode = await storage.read(key: 'user_pin');
            setState(() {
              pin = TextEditingController(text: staffStoredCode);
            });
            showDialog(
                context: context,
                builder: (context) => const LoaderDialog());
            Future.delayed(
                const Duration(
                  seconds: 2,
                ), () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainScreen()),
                      (route) => false);
            });
          }
        }
      }
    } else {}
  }

  @override
  void initState() {
    getSecureStorage();
    super.initState();
  }

  @override
  void dispose() {
   pinFous.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade900,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.black12)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Please Enter Your PIN',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                  child: SizedBox(
                    height: 60,
                    child: Center(
                      child: TextField(
                        focusNode: pinFous,
                        autofocus: true,
                        controller: pin,
                        textAlign: TextAlign.center,
                        obscureText: true,
                        style: TextStyle(fontSize: 36),
                        cursorColor: Colors.black,
                        // cursorHeight: 35,
                        showCursor: false,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(4),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(color: Colors.black)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(color: Colors.red)),
                        ),
                        onChanged: (value) {
                          if (pin.text.isNotEmpty && pin.text.length == 4) {
                            if (pin.text.toString() == '1234') {
                              showDialog(
                                  context: context,
                                  builder: (context) => const LoaderDialog());
                              Future.delayed(
                                  const Duration(
                                    seconds: 2,
                                  ), () {
                                Navigator.pop(context);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainScreen()),
                                    (route) => false);
                              });
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => const LoaderDialog());
                              Future.delayed(
                                  const Duration(
                                    seconds: 2,
                                  ), () {
                                Navigator.pop(context);
                                setState(() {
                                  pin.clear();
                                });
                              });
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
