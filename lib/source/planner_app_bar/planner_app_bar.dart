import 'package:flutter/material.dart';

import 'package:planner/global/theme.dart' as appTheme;

import 'package:planner/source/planner_app_bar/planner_app_bar_theme.dart';
import 'package:planner/source/planner_app_bar/planner_app_bar_paths.dart';
import 'package:planner/source/planner_app_bar/planner_app_bar_button.dart';

/// Custom AppBar for Planner.

class PlannerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String caption;

  final PlannerAppBarTheme theme = PlannerAppBarTheme();

  /// Constructor.

  PlannerAppBar({
    required this.caption,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.mineColor,
      height: 49,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 14),
            child: AppBarButton(
              theme: theme,
              iconPath: leftArrowIcon,
              onPressed: (){Navigator.pop(context);},
            )
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                caption,
                style: TextStyle(
                  color: theme.textColor,
                  fontSize: 17,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 14),
            child: AppBarButton(
              theme: theme,
              iconPath: theme.isDark? sunIcon : moonIcon,
              onPressed: (){appTheme.themeChange();}
            )
          )
        ]
      )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(49);

}