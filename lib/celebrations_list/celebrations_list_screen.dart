import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:planner/celebrations_list/celebrations_list_logic.dart';
import 'package:planner/celebrations_list/celebrations_list_inscriptions.dart';

import 'package:planner/source/planner_app_bar/planner_app_bar.dart';
// import 'package:planner/celebrate_list/celebrate_choice_screen_view.dart';
//
// import 'package:planner/celebrate_list/celebrate_choice_screen_view.dart';
// import 'package:site_xz/detail_contact_screen_view.dart';
// import 'buttons.dart';
// import 'paths.dart';
// import 'theme.dart';
// import 'package:site_xz/add_contact_screen_view.dart';
// import 'package:site_xz/edit_contact_screen_view.dart';
// import 'package:site_xz/main_screen/planner_main_screen_view.dart';

/// Screen 2.5 from Figma layout.
class CelebrationsListScreen extends StatefulWidget {

  static const route = '/celebrations_list';

  final CelebrationsListLogic logic;

  const CelebrationsListScreen({
    super.key,
    required this.logic
  });

  @override
  State<CelebrationsListScreen> createState() => _CelebrationsListScreenState();

}

class _CelebrationsListScreenState extends State<CelebrationsListScreen> {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CelebrationsListDataState>(
      initialData: widget.logic.dataState,
      stream: widget.logic.state,
      builder: (context, snapshot) {
        CelebrationsListDataState dataState = widget.logic.dataState;
        if (dataState.isLoaded){
          return Scaffold(
            appBar: PlannerAppBar(caption: screenName),
            body: Text(
              "Данные загружены"
            )
          );
        }
        return Text("Данные загружаются");
      }
    );
  }

}