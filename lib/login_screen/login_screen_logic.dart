import 'dart:html';

import 'package:http/http.dart' as http;

class LoginLogic{

  final http.Client client;

  LoginLogic({required this.client});

  /// Функция получения токена доступа к серверу бэкэнда.
  // Future<void> login() async{
  //   await Future.delayed(const Duration(seconds: 3), () {
  //     print(provider.authState.isAuthSuccess);
  //   });
  //   final String token = provider.authState.token;//"44d8fdc7dc9c0a05c5f0bcbe4f32b2fdd5f02424";
  //   print(token);
  //   await provider.postRequest(token);
  //   await provider.contactListRequest(token);
  //   List<Contact> contactList = provider.contactList;
  //
  //   String responseAnswer = utf8.decode(provider.postResponse.response.bodyBytes);
  //   final Person person = Person.fromJson(jsonDecode(responseAnswer));
  //   print('праздников пришло ${person.celebrates.length}');
  //   print("${person.celebrates[0].id}, ${person.celebrates[0].day} ${person.celebrates[0].month} ${person.celebrates[0].date}");
  //   print("${person.celebrates[0].name}, ${person.celebrates[0].icon} ${person.celebrates[0].peopleCategory} ${person.celebrates[0].celebrateCategory}");
  //   AppController appController = AppController(person, contactList);
  //   Navigator.push(
  //       context, MaterialPageRoute(
  //       builder: (context) {
  //         print("дошло до сюда");
  //         return MainPlannerScreen(widget.title, widget.mainWidth, appController, token);
  //         // return MokScreen(widget.title, widget.mainWidth, appController, token);
  //       }
  //   )
  //   );
  // }

}