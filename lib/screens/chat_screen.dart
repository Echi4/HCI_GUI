import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:mpesa_ui/API/answerApi.dart';
import 'package:mpesa_ui/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mpesa_ui/utils/colors.dart';
import '../API/modelsApi.dart';
import '../services/assets_manager.dart';
import '../widgets/chat_widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isTyping = false;
  List answers = [];
  List chatsList = [];
  int listIndex = 0;
  late FocusNode focusNode;
  late ScrollController listScrollController;

  TextEditingController textEditingController = TextEditingController();
  String? modelUsed;

  @override
  void initState() {
    modelUsed = offlineModels[5]['id'];
    listScrollController = ScrollController();
    focusNode = FocusNode();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    listScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Image.asset(AssetsManager.openaiLogo2),
        // ),
        title: const Text(
          'Huduma Bot',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       icon: Icon(
        //         FontAwesomeIcons.x,
        //         size: 20,
        //         color: Colors.black,
        //       ))
        // ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.007,
          ),
          Flexible(
              child: ListView.builder(
                  controller: listScrollController,
                  itemCount: chatsList.length,
                  itemBuilder: (context, index) {
                    return ChatWidget(
                      question: chatsList[index]['message'],
                      answer: chatsList[index]['reply'],
                    );
                  })),
          if (_isTyping) ...[
            const SpinKitThreeBounce(
              color: Colors.blueGrey,
              size: 18,
            ),
          ],
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 4),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: AppColors.primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      focusNode: focusNode,
                      controller: textEditingController,
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      onSubmitted: (value) async {
                        //TODO: FUNCTION GOES HERE
                        sendQuestion();
                      },
                      decoration: InputDecoration.collapsed(
                          hintText: 'Nikusaidiaje',
                          hintStyle: TextStyle(color: Colors.white70)),
                    )),
                    IconButton(
                        onPressed: () async {
                          sendQuestion();
                        },
                        icon: Icon(
                          IconlyBold.send,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  scrollToEnd() async {
    listScrollController.animateTo(
        listScrollController.position.maxScrollExtent,
        duration: Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  sendQuestion() async {
    if (textEditingController.text.isNotEmpty) {
      String? temp;
      //TODO: FUNCTION GOES HERE
      setState(() {
        _isTyping = true;
        temp = textEditingController.text;
        questionsList.add({'message': temp});
        // chatList.add({'reply': null,'message': textEditingController.text});
        // chatsList.add({'reply': null, 'message': temp});
        listIndex += 1;
      });
      textEditingController.clear();
      focusNode.unfocus();

      await getChatCompletionAnswer(
          question: temp, model: modelUsed, context: context);
      setState(() {
        scrollToEnd();
        chatsList = [];
        answers = answersList;
        chatsList = chatServer;
        _isTyping = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        padding: EdgeInsets.all(8.0),
        duration: Duration(seconds: 1),
        content: SizedBox(
          child: Center(
            child: Text(
              'Please type a Question',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        backgroundColor: CupertinoColors.systemRed,
      ));
    }
  }
}
