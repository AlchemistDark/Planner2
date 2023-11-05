import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:planner/celebrations_list/celebrations_list_models.dart';

import 'package:planner/global/variables and constants.dart' as global;


/// Logic for [LoginScreen] class.
class CelebrationsListLogic{

  static const String _URL =  'https://qviz.fun/api/v1/holidays/';

  CelebrationsListDataState dataState = CelebrationsListDataState(
    userCelebrationsList: null,
    celebrationsCategoriesList: null,
    isLoaded: false
  );

  Stream<CelebrationsListDataState> get state => _sCtrl.stream;
  final StreamController<CelebrationsListDataState> _sCtrl
     = StreamController<CelebrationsListDataState>.broadcast();

  // late final UserCelebrationsList userCelebrationsList;

  // ResponseStatus responseStatus = ResponseStatus.unKnownError;

  CelebrationsListLogic(){
    celebrationsListRequest();
  }

  Future<void>celebrationsListRequest()async{
    http.Response? response = await global.client.post(
      Uri.parse(_URL),
      headers: {"Authorization": 'Token ${global.token}'}
    );
    UserCelebrationsList userCelebrationsList = UserCelebrationsList.fromJson(
      jsonDecode(response.body)
    );
    dataState = CelebrationsListDataState(
        userCelebrationsList: userCelebrationsList,
        celebrationsCategoriesList: null,
        isLoaded: true
    );
    _sCtrl.add(dataState);
    print('селебрэйшн лист $userCelebrationsList');
    // print(result);
    // return result;
  }


  // Future<List<Celebrate>> celebrationsListRequest(String token) async {
  //   List<Celebrate> celebrationsList = [];
  //   http.Response postR = await http.post(
  //       Uri.https('qviz.fun', 'api/v1/holidays/'),
  //       headers: {"Authorization": 'Token $token'}
  //   );
  //   print("праздники ${utf8.decode(postR.bodyBytes)}");
  //   final Map<String, dynamic> json = jsonDecode(utf8.decode(postR.bodyBytes));
  //   var temp = (json["holidays"] as List<dynamic>);
  //   for (var i in temp){
  //     Celebrate celebrate = Celebrate.fromJson(i as Map<String, dynamic>);
  //     celebrationsList.add(celebrate);
  //     if (id < celebrate.id) {id = celebrate.id;}
  //   }
  //   print("контакты $celebrationsList");
  //   print("имя ${celebrationsList[1].name} дата ${celebrationsList[1].date}");//  ДР ${contactList[1].birthday} город ${contactList[1].region}");
  //   // print("фон ${contactList[1].phone} тг ${contactList[1].telegram} имэйл ${contactList[1].email}");
  //   // print("кат ${contactList[1].cat} пол ${contactList[1].sex} статус ${contactList[1].status}");
  //   return celebrationsList;
  // }

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
  // Future<http.Response?> getToken({required String number, required String pass}) async {
  //   http.Response? response = await client.post(
  //     Uri.parse(_tokenURL),
  //     body: {
  //       'phoneNumber': number,
  //       'password': pass
  //     },
  //   ).then((response){
  //     switch(response.statusCode) {
  //       case 200:
  //         global.token = tokenFromJson(json.decode(response.body));
  //         responseStatus = ResponseStatus.oK;
  //         if (kDebugMode) {
  //           print("Код статуса ответа сервера: ${response.statusCode}");
  //         }
  //         break;
  //       case 400:
  //         responseStatus = ResponseStatus.loginDataIncorrect;
  //         if (kDebugMode) {
  //           print("Код статуса ответа сервера: ${response.statusCode}");
  //         }
  //         break;
  //       case 404:
  //         responseStatus = ResponseStatus.pageDoesNotExist;
  //         if (kDebugMode) {
  //           print("Код статуса ответа сервера: ${response.statusCode}");
  //         }
  //         break;
  //       default:
  //         if (kDebugMode) {
  //           print("Код статуса ответа сервера: ${response.statusCode}");
  //         }
  //     }
  //   }).catchError((error){
  //     if (error.runtimeType == http.ClientException) {
  //       if (error.message == 'XMLHttpRequest error.') {
  //         responseStatus = ResponseStatus.serverDonTWork;
  //         if (kDebugMode) {
  //           print("Сообщение об ошибке: ${error.message}");
  //         }
  //       }
  //     }
  //     if (kDebugMode) {
  //       print("Тип ошибки: ${error.runtimeType}");
  //     }
  //   });
  //   return response;
  // }

}

// enum ResponseStatus{
//   loginDataIncorrect,
//   oK,
//   pageDoesNotExist,
//   serverDonTWork,
//   unKnownError
// }

class CelebrationsListDataState{

  final UserCelebrationsList? userCelebrationsList;
  final CelebrationsCategoriesList? celebrationsCategoriesList;
  final bool isLoaded;

  CelebrationsListDataState({
    required this.userCelebrationsList,
    required this.celebrationsCategoriesList,
    required this.isLoaded
  });

}
