import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:planner/global/theme.dart' as theme;
import 'package:planner/global/variables and constants.dart' as global;

import 'package:planner/login_screen/login_screen_logic.dart';
import 'package:planner/login_screen/login_screen_view.dart';

void main() {

  // Светлая тема запускается между 9 часов утра и 8 часов вечера.
  // В остальное время запускается тёмная тема.
  if(DateTime.now().hour > 8 && DateTime.now().hour < 20){
    theme.appTheme = theme.AppTheme.light();
  }else{
    theme.appTheme = theme.AppTheme.dark();
  }

  runApp(MyApp(client: global.client));
}

class MyApp extends StatefulWidget {

  final http.Client client;

  const MyApp({
    super.key,
    required this.client
  });

  @override
  State<StatefulWidget> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<theme.ThemeState>(
      initialData: theme.themeState,
      stream: theme.state,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Nataly Beauty Planner',
          home: LoginScreen(logic: LoginLogic())
        );
      }
    );
  }

}
