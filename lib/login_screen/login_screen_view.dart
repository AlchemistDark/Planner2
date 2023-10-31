// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:planner/global/variables and constants.dart' as global;

import 'package:planner/login_screen/login_screen_inscriptions.dart';
import 'package:planner/login_screen/login_screen_logic.dart';
import 'package:planner/login_screen/login_screen_paths.dart';
import 'package:planner/login_screen/login_screen_theme.dart';

import 'package:planner/monthly_calendar_screen/monthly_calendar_screen.dart';

import 'package:planner/source/buttons.dart';

// import 'package:http/http.dart' as http;
//
// import 'global/app_controller.dart';
// import 'global/person_class.dart';
// import 'global/planner_app_bar.dart';
// import 'global/provider.dart';
// import 'main_screen/planner_main_screen_view.dart';

/// Screen 1.3
class LoginScreen extends StatefulWidget {

  final LoginLogic logic;

  const LoginScreen({
    super.key,
    required this.logic,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String _phoneNumber = "";
  String _password = "";
  bool _isObscure = true;

  /// Open mine screen.

  void open(){
    Navigator.push(
      context, MaterialPageRoute(builder: (_) => const Screen28())
    );
  }

  /// User Sign In.
  Future<void> signIn() async{
    await widget.logic.getToken(number: _phoneNumber, pass: _password);
    switch (widget.logic.responseStatus){
      case ResponseStatus.loginDataIncorrect:
        if(mounted){
          showDialog(context: context, builder: (BuildContext context){
            return const MiniAlertDialog(caption: alertMessageLoginDataIncorrect);
          });
        }
        break;
      case ResponseStatus.oK:
        if(mounted){// ToDo
          open();
        }
        break;
      case ResponseStatus.pageDoesNotExist:
        if(mounted){
          showDialog(context: context, builder: (BuildContext context){
            return const MiniAlertDialog(caption: alertMessagePageDoesNotExist);
          });
        }
        break;
      case ResponseStatus.serverDonTWork:
        if(mounted){
          showDialog(context: context, builder: (BuildContext context){
            return const MiniAlertDialog(caption: alertMessageServerDontWork);
          });
        }
        break;
      case ResponseStatus.unKnownError:
        if(mounted){
          showDialog(context: context, builder: (BuildContext context){
            return const MiniAlertDialog(caption: alertMessageUnknown);
          });
        }
    }
  }

  @override
  Widget build(BuildContext context) {

    // Соотношение сторон у части экрана с полезным содержимым 1 к 1.696,
    // Если оно меньше, то по бокам добавляем пустые поля,
    // размер которых рассчитывается ниже.

    // Определяем достаточное ли соотношение сторон
    const double targetAspectRatio = 1.696;
    final bool isPortraitOrientation = (
        (MediaQuery.of(context).size.height /
            MediaQuery.of(context).size.width) > targetAspectRatio);
    // Определяем ширину полезной части. Остальное займут пустые поля.
    final double columnWidth = (isPortraitOrientation)
        ? MediaQuery.of(context).size.width
        : (MediaQuery.of(context).size.height / targetAspectRatio);
    // Опредиляем размер виртуального пикселя, для масштабирования логотипа.

    // Ширина макета страницы:
    final voxel = columnWidth / global.designerPageLayoutWidth;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: InkWell(
        onTap: () {
          document.documentElement?.requestFullscreen();
        },
        child: Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: columnWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Expanded(flex: 3, child: SizedBox()),
                  Center(
                    child: SizedBox(
                      width: 217 * voxel,
                      height: 57 * voxel,
                      child: SvgPicture.asset(logoPath)
                    )
                  ),
                  const Expanded(flex: 3, child: SizedBox()),
                  AutofillGroup(
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              ' $telephoneNumberSrt',
                              style: TextStyle(
                                color: captionColor,
                                fontFamily: 'Roboto',
                                fontSize: 14
                              ),
                            ),
                            Text(
                              '*',
                              style: TextStyle(
                                color: asterixColor,
                                fontFamily: 'Roboto',
                                fontSize: 14
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 44,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: textFieldFillColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: textFieldBorderColor,
                              width: 1.5
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, bottom: 10),
                            child: TextField(
                              autofillHints: const [AutofillHints.username],
                              onChanged: (text){_phoneNumber = text;},
                              cursorColor: captionColor,
                              textAlignVertical: TextAlignVertical.top,
                              style: const TextStyle(
                                color: captionColor,
                                fontFamily: 'Roboto',
                                fontSize: 15
                              ),
                              decoration: const InputDecoration(
                                hintText: telephoneNumberHint,
                                hintStyle: TextStyle(
                                  color: captionColor,
                                  fontFamily: 'Roboto400',
                                  fontSize: 15
                                ),
                                border: InputBorder.none
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          children: [
                            Text(
                              ' $passwordStr',
                              style: TextStyle(
                                color: captionColor,
                                fontFamily: 'Roboto',
                                fontSize: 14
                              ),
                            ),
                            Text(
                              '*',
                              style: TextStyle(
                                color: asterixColor,
                                fontFamily: 'Roboto',
                                fontSize: 14
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 44,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: textFieldFillColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: textFieldBorderColor,
                              width: 1.5
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, bottom: 10),
                            child: TextField(
                              autofillHints: const [AutofillHints.password],
                              cursorColor: captionColor,
                              obscureText: _isObscure,
                              onChanged: (text){_password = text;},
                              textAlignVertical: TextAlignVertical.top,
                              style: const TextStyle(
                                color: captionColor,
                                fontFamily: 'Roboto',
                                fontSize: 15
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: passwordHint,
                                hintStyle: const TextStyle(
                                  color: captionColor,
                                  fontFamily: 'Roboto',
                                  fontSize: 15
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure ? Icons.visibility
                                      : Icons.visibility_off,
                                    color: captionColor,
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            const SizedBox(width: 2),
                            RectangularButton(
                              caption: signInStr,
                              onTap: (){
                                TextInput.finishAutofillContext();
                                signIn();
                                //   widget.logic.getToken(
                                //   number: _phoneNumber,
                                //   pass: _password
                                // );
                              },
                            ),
                            const SizedBox(width: 2)
                          ]
                        ),
                      ]
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$doHaveAccount  ',
                        style: TextStyle(
                          color: inscriptionsColor,
                          fontFamily: 'Roboto',
                          fontSize: 14
                        ),
                      ),
                      Text(
                        signUpSrt,
                        style: TextStyle(
                          color: linkColor,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                  const Expanded(flex: 9, child: SizedBox())
                ],
              )
            )
          ]
        )
      )
    );
  }
}

/// Custom alert dialog.
class MiniAlertDialog extends StatelessWidget{

  final String caption;

  const MiniAlertDialog({
    super.key,
    required this.caption
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(dialogTitle),
      content: Text(caption),
      actions: [
        ElevatedButton(
          onPressed: (){Navigator.of(context).pop();},
          child: const Text(cancel)
        ),
      ],
    );
  }

}