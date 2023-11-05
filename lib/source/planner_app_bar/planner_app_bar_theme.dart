// Цвета для AppBar.

import 'package:flutter/material.dart';

import 'package:planner/global/theme.dart';

class PlannerAppBarTheme{

  // appTheme != null потому, что создаётся перед запуском приложения
  // в main.dart.

  final bool isDark = appTheme!.isDark;

  final Color buttonIconColor = const Color(0xFFA6ADB5);
  
  final Color mainGreenColor =  appTheme!.mainGreenColor;

  final Color mineColor;
  final Color textColor;
  final Color buttonShadowColor;

  late final List<Color> buttonBorderGradientColors;
  late final List<Color> buttonFillGradientColors;

  factory PlannerAppBarTheme(){
    // appTheme != null потому, что создаётся перед запуском приложения
    // в main.dart.
    if (appTheme!.isDark){
      return PlannerAppBarTheme.dark();
    }
    return PlannerAppBarTheme.light();
  }

  PlannerAppBarTheme.light({
    this.mineColor = const Color(0xFFF0F7FE),
    this.textColor = const Color(0xFF161A1D),
    this.buttonShadowColor = const Color(0xFFFFFFFF)
  }){
    buttonBorderGradientColors = [
      const Color(0xFFFFFFFF),
      const Color(0xFFFFFFFF)
    ];
    buttonFillGradientColors = [
      const Color(0xFFE0ECFA),
      const Color(0xFFFFFFFF)
    ];

    // buttonGradient = LinearGradient(
    //   begin: Alignment.topLeft,
    //   end: Alignment.bottomRight,
    //   colors: [
    //     const Color(0xFF62C6AA).withOpacity(0.1),
    //     const Color(0xFF44A88C).withOpacity(0.1),
    //   ],
    // );
  }

  PlannerAppBarTheme.dark({
    this.mineColor = const Color(0xFF1B1C22),
    this.textColor = const Color(0xFFFFFFFF),
    this.buttonShadowColor = const Color(0xFF1C1F26)
  }){
    buttonBorderGradientColors = [
      const Color(0xFF1C1F26),
      const Color(0xFF4B4F5F)
    ];
    buttonFillGradientColors = [
      const Color(0xFF464851),
      const Color(0xFF282B33)
    ];

    // buttonGradient = LinearGradient(
    //   begin: Alignment.topLeft,
    //   end: Alignment.bottomRight,
    //   colors: [
    //     const Color(0xFF62C6AA).withOpacity(0.1), // ToDo this is no dark.
    //     const Color(0xFF44A88C).withOpacity(0.1), // ToDo this is no dark.
    //   ],
    // );
  }

}