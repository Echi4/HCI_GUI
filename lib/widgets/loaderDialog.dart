import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoaderDialog extends StatelessWidget {
  const LoaderDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 108, right: 108),
      child: Dialog(
        insetAnimationDuration: const Duration(seconds: 0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
          ),
          height: 90,
          width: MediaQuery.of(context).size.width * 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (Platform.isIOS) ...[
                const CircularProgressIndicator.adaptive(
                  backgroundColor: CupertinoColors.systemIndigo,
                )
              ] else ...[
                const CircularProgressIndicator(
                  color: CupertinoColors.systemIndigo,
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
