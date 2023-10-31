import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'theme.dart';

/// The green circle button with an icon and gradient.
class GreenCircleButton extends StatelessWidget {
  final AppTheme theme;
  final String iconPath;
  final VoidCallback onTap;

  GreenCircleButton({
    required this.theme,
    required this.iconPath,
    required this.onTap,
    Key? key
  }) : super(key: key);

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: SizedBox(
        width: 36,
        height: 36,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFD3E8E7),
                Color(0xFFC9E2E1),
              ],
            ),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: const Color(0xFF52B69A),
              width: 1,
            ),
          ),
          child: SvgPicture.asset(
            iconPath,
            fit: BoxFit.scaleDown,
            color: const Color(0xFF52B69A),
            width: 16,
            height: 16,
          ),
        ),
      ),
    );
  }
}