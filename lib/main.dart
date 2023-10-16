import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:planner/login_screen/global/theme.dart';

import 'package:planner/login_screen/login_screen_logic.dart';
import 'package:planner/login_screen/login_screen_view.dart';

void main() {

  /// Клиент для REST API создаётся здесь. Один на весь сеанс пользователя,
  /// что бы не тратить время на его повторное создание.
  final http.Client client = http.Client();
  appTheme = AppTheme.light();

  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {

  final http.Client client;

  const MyApp({
    super.key,
    required this.client
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nataly Beauty Planner',
      home: LoginScreen(
        logic: LoginLogic(client: client)
      )//MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
