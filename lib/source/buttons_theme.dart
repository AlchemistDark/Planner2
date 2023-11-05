// Цвета и градиетны для кнопок.

import 'package:flutter/material.dart';

import 'package:planner/global/theme.dart';

class BtnTheme{

  final Color buttonColor;

  late final LinearGradient buttonGradient;

  factory BtnTheme(){
    // appTheme != null потому, что создаётся перед запуском приложения
    // в main.dart.
    if (appTheme!.isDark){
      return BtnTheme.dark();
    }
    return BtnTheme.light();
  }

  BtnTheme.light({
    this.buttonColor = const Color(0xFF52B69A)
  }){
    buttonGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFF62C6AA).withOpacity(0.1),
        const Color(0xFF44A88C).withOpacity(0.1),
      ],
    );
  }

  BtnTheme.dark({
    this.buttonColor = const Color(0xFF52B69A) // ToDo this is no dark.
  }){
    buttonGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFF62C6AA).withOpacity(0.1), // ToDo this is no dark.
        const Color(0xFF44A88C).withOpacity(0.1), // ToDo this is no dark.
      ],
    );
  }

}