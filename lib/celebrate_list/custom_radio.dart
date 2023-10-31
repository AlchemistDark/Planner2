import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

/// Виджет RadioButton для Экрана "Подарок".

class CustomRadio<T> extends StatelessWidget {
  final ValueChanged<T?> onChanged;
  final T value;
  final T groupValue;

  const CustomRadio({Key? key,
    required this.onChanged,
    required this.value,
    required this.groupValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (value == groupValue) {
      return Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFF52B69A),
            width: 2,
          ),
        ),
        child: Center(
          child: Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              color: Color(0xFF52B69A),
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    }
    return Listener(
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.red,
            // color: context.read<ThemeBloc>().state.isDark
            //     ? AppTheme.in,activeButtonBorderColor
            //     : const Color.fromRGBO(200, 210, 219, 1),
            width: 2,
          ),
          color: Colors.red,
          // color: context.read<ThemeBloc>().state.isDark
          //     ? AppTheme.inactiveButtonFillColor
          //     : const Color.fromRGBO(229, 232, 247, 1),
        ),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
      ),
      onPointerDown: (_) {
        onChanged(value);
      },
    );
  }
}
