import 'dart:convert';

import 'package:mpesa_ui/API/apiVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

getCompletionAnswer(
    {required question, required model, required context}) async {
  try {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $API_Key'
    };
    var request = http.Request('POST', Uri.parse('$BASE_URL/completions'));
    request.body = json.encode({
      "model": model.toString(),
      "prompt": question.toString(),
      "max_tokens": 50,
      "temperature": 0
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var out = await response.stream.bytesToString();
    var output = jsonDecode(out);

    // if(output['error']!=null){
    //   throw output['error']['message'];
    // }

    if (response.statusCode == 200) {
      var data = output['choices'][0]['text'];
      chatServer.add({
        'reply': output['choices'][0]['text'],
        'message': question.toString()
      });
      if (output['choices'].length > 0) {
        print(output['choices']);
        chatList = [];
        for (int i = 0; i <= output['choices'].length; i++) {
          answersList.add({'reply': output['choices'][i]['text']});
          chatList.add({
            'reply': output['choices'][i]['text'],
            'message': question.toString()
          });
// chatServer.add({'reply': chatList[0]['reply'],'message': chatList[0]['message'].toString()});
// print(chatList);
        }

        print(chatServer);
      }

      return data;
    } else {
      // print(response.reasonPhrase);
    }
  } catch (e) {
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1),content: Text(e.toString(),style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700)),backgroundColor: CupertinoColors.systemRed,));
  }
}

getChatCompletionAnswer(
    {required question, required model, required context}) async {
  try {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $API_Key'
    };
    var response = await http.post(Uri.parse('$BASE_URL/chat/completions'),
        headers: headers,
        body: json.encode({
          "model": model.toString(),
          "messages": [
            {"role": "user", "content": question.toString()}
          ],
          "max_tokens": 50,
          "temperature": 0
        }));

    var output = jsonDecode(response.body);

    // if(output['error']!=null){
    //   throw output['error']['message'];
    // }

    print(output);
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
// chatServer.add({'reply': chatList[0]['reply'],'message': chatList[0]['message'].toString()});
// print(chatList);
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

List questionsList = [];
List answersList = [];
List chatList = [];
List chatServer = [];

List responseModelsample = [
  {
    "id": "chatcmpl-74CctRnDikdXx6oXDJF8Wuiqj2Hob",
    "object": "chat.completion",
    "created": 1681236203,
    "model": "gpt-3.5-turbo-0301",
    "usage": {"prompt_tokens": 14, "completion_tokens": 5, "total_tokens": 19},
    "choices": [
      {
        "message": {"role": "assistant", "content": "This is a test!"},
        "finish_reason": "stop",
        "index": 0
      }
    ]
  }
];
