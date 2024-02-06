import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'apiVariables.dart';

class ChatProvider extends ChangeNotifier {
  List questionsList = [];
  List answersList = [];
  List chatList = [];
  List chatServer = [];

  getChatCompletionAnswer(
      {required question, required model, required context}) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $API_Key'
      };
      var request =
          http.Request('POST', Uri.parse('$BASE_URL/chat/completions'));
      request.body = json.encode({
        "model": model.toString(),
        "messages": [
          {"role": "user", "content": question.toString()}
        ],
        "max_tokens": 50,
        "temperature": 0
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var out = await response.stream.bytesToString();
      var output = jsonDecode(out);

      if (response.statusCode == 200) {
        var data = output['choices'][0]['message']['content'];
        chatServer.add({
          'reply': output['choices'][0]['message']['content'],
          'message': question.toString()
        });
        if (output['choices'].length > 0) {
          chatList = [];
          for (int i = 0; i <= output['choices'].length; i++) {
            answersList
                .add({'reply': output['choices'][i]['message']['content']});
            chatList.add({
              'reply': output['choices'][i]['message']['content'],
              'message': question.toString()
            });
          }
        }

        return data;
      } else {
        // print(response.reasonPhrase);
      }
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1),content: Text(e.toString(),style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700)),backgroundColor: CupertinoColors.systemRed,));
    }
  }
}
