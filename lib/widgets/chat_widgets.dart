import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:mpesa_ui/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:mpesa_ui/utils/colors.dart';
import '../services/assets_manager.dart';

class ChatWidget extends StatelessWidget {
  var question, answer;
  ChatWidget({Key? key, this.answer, this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8.0, bottom: 10),
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              color: Colors.black,
              child: SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(
                          question.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                        SizedBox(
                          width: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: const Icon(
                            FontAwesomeIcons.user,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        answer == null
            ? SizedBox.shrink()
            : Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 10),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    color: AppColors.primaryColor,
                    child: SizedBox(
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: const Icon(
                                  FontAwesomeIcons.robot,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                  child: DefaultTextStyle(
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                      child: AnimatedTextKit(
                                        displayFullTextOnTap: true,
                                        isRepeatingAnimation: false,
                                        repeatForever: false,
                                        totalRepeatCount: 1,
                                        animatedTexts: [
                                          TyperAnimatedText(
                                              answer.toString().trim())
                                        ],
                                      ))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}

class ReplyWidget extends StatelessWidget {
  const ReplyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, bottom: 10),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20))),
          color: AppColors.primaryColor,
          child: SizedBox(
            width: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AssetsManager.botImage,
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Expanded(
                        child: Text(
                      'Chat Bot',
                      style: TextStyle(color: Colors.white),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
