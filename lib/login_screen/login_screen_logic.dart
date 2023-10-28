import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:planner/global/variables and constants.dart' as global;

/// Logic for [LoginScreen] class.
class LoginLogic{

  static const String _tokenURL = 'https://qviz.fun/auth/token/login';

  ResponseStatus responseStatus = ResponseStatus.unKnownError;

  final http.Client client;

  LoginLogic({required this.client});

  /// JSON parsing function that the server produces in response
  /// to a request for an access token.
  String tokenFromJson(Map<String, dynamic> json){
    String result = json['auth_token'] as String;
    return result;
  }

  /// Opens alertDialog.
  // void openDialog(){
  //   showDialog(context: context, builder: (BuildContext context){
  //     return AlertDialog(
  //       title: Text("Предупреждение!"),
  //       content: Text("Вы действительно хотите удалить $id из списка контактов?"),
  //       actions: [
  //         ElevatedButton(
  //             onPressed: () async {
  //               widget.appController.celebrateDelete(id, widget.token);
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text("Удалить")),
  //         ElevatedButton(
  //             onPressed: (){Navigator.of(context).pop();},
  //             child: const Text("Отмена")),
  //       ],
  //     );
  //   });
  // }

  /// Function for obtaining an access token to the backend server.
  Future<http.Response?> getToken({required String number, required String pass}) async {
    http.Response? response = await client.post(
      Uri.parse(_tokenURL),
      body: {
        'phoneNumber': number,
        'password': pass
      },
    ).then((response){
      switch(response.statusCode) {
        case 200:
          global.token = tokenFromJson(json.decode(response.body));
          responseStatus = ResponseStatus.oK;
          if (kDebugMode) {
            print("Код статуса ответа сервера: ${response.statusCode}");
          }
          break;
        case 400:
          responseStatus = ResponseStatus.loginDataIncorrect;
          if (kDebugMode) {
            print("Код статуса ответа сервера: ${response.statusCode}");
          }
          break;
        case 404:
          responseStatus = ResponseStatus.pageDoesNotExist;
          if (kDebugMode) {
            print("Код статуса ответа сервера: ${response.statusCode}");
          }
          break;
        default:
          if (kDebugMode) {
            print("Код статуса ответа сервера: ${response.statusCode}");
          }
      }
    }).catchError((error){
      if (error.runtimeType == http.ClientException) {
        if (error.message == 'XMLHttpRequest error.') {
          responseStatus = ResponseStatus.serverDonTWork;
          if (kDebugMode) {
            print("Сообщение об ошибке: ${error.message}");
          }
        }
      }
      if (kDebugMode) {
        print("Тип ошибки: ${error.runtimeType}");
      }
    });
    return response;
  }

}

enum ResponseStatus{
  loginDataIncorrect,
  oK,
  pageDoesNotExist,
  serverDonTWork,
  unKnownError
}