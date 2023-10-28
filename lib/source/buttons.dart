import 'package:flutter/material.dart';

import 'package:planner/source/buttons_theme.dart';

/// The rectangular button that is used everywhere in the application.
class RectangularButton extends StatelessWidget {
  final String caption;
  final Function onTap;

  const RectangularButton({
    required this.caption,
    required this.onTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        height: 44,
        child: InkWell(
          onTap: () {
            onTap.call();
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: buttonGradient,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: buttonColor,
                width: 1,
              ),
            ),
            child: Text(
              caption,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: buttonColor
              ),
              textAlign: TextAlign.center,
            )
          )
        )
      )
    );
  }
}