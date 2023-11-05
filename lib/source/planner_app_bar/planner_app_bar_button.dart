import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:planner/source/planner_app_bar/planner_app_bar_theme.dart';

/// Button class for [PlannerAppBar].
class AppBarButton extends StatefulWidget {

  final PlannerAppBarTheme theme;
  final String iconPath;
  final Function onPressed;

  const AppBarButton({
    required this.theme,
    required this.iconPath,
    required this.onPressed,
    Key? key
  }) : super(key: key);

  @override
  State<AppBarButton> createState() => _AppBarButtonState();

}

class _AppBarButtonState extends State<AppBarButton> {

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color green = widget.theme.mainGreenColor;
    Color shadowColor = widget.theme.buttonShadowColor;
    Color iconColor = widget.theme.buttonIconColor;
    List<Color> borderGradientColors = widget.theme.buttonBorderGradientColors;
    List<Color> fillGradientColors = widget.theme.buttonFillGradientColors;

    return Listener(
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: isPressed ? green : shadowColor,
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(4, 4),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isPressed ? [green, green] : borderGradientColors,
          )
        ),
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: fillGradientColors
            )
          ),
          child: SvgPicture.asset(
            widget.iconPath,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              isPressed ? green : iconColor,
              BlendMode.srcIn,
            ),
            width: 16,
            height: 16,
          ),
        )
      ),
      onPointerDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onPointerUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onPressed();
      }
    );
  }
}