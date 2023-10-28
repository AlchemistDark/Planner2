// Цвета и градиетны для кнопок.

import 'package:flutter/material.dart';

final LinearGradient buttonGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    const Color(0xFF62C6AA).withOpacity(0.1),
    const Color(0xFF44A88C).withOpacity(0.1),
  ],
);

const Color buttonColor = Color(0xFF52B69A);