import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'buttons.dart';
import 'paths.dart';
import '../source/planner_app_bar/planner_app_bar.dart';
import 'theme.dart';

import 'dart:math';

class CelebrateChoiceScreen extends StatefulWidget {
  static const route = '/holiday';

  bool isEditable = false;
  final String title;
  final String name;
  final List<String> celebrations;
  final AppTheme theme;

  CelebrateChoiceScreen(
    this.title,
    this.name,
    this.celebrations,
    this.theme,
    {Key? key}
  ) : super(key: key);

  @override
  State<CelebrateChoiceScreen> createState() => _CelebrateChoiceScreenState();

}

class _CelebrateChoiceScreenState extends State<CelebrateChoiceScreen> {

  int? checkedCelebrateIndex;
  String? checkedCelebrateName;

  final ScrollController _scrollControllerCategoriesBlock = ScrollController();

  _CelebrateChoiceScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlannerAppBar(
        callBack: (){Navigator.pop(context);},
        child: Container(
          alignment: Alignment.center,
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.theme.appBarTextColor,
              fontSize: 17,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500
            ),
          ),
        )
      ),
      body: Container(
        color: widget.theme.mainColor,
          child: Column(
            children: <Widget>[
              /// Separator line.
              const SizedBox(
                height: 22
              ),
              /// Category name.
              Container(
                height: 36,
                margin: const EdgeInsets.only(left: 16, right: 16),
                color: widget.theme.mainColor,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 8, top: 16),
                        child: Text(
                          widget.name,
                          style: TextStyle(
                            color: widget.theme.avatarText1Color,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500
                          ),
                        )
                      )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.topCenter,
                          height: 36,
                          width: 36,
                          child: GreenAnimatedButton(
                            theme: widget.theme,
                            iconPath: leftArrowButtonIcon,
                            onTap: (){} //userNumberDown, // ToDo переписать, так как сейчас юзеры приходят не с сервера.
                          )
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          alignment: AlignmentDirectional.topCenter,
                          height: 36,
                          width: 36,
                          child: GreenAnimatedButton(
                            theme: widget.theme,
                            iconPath: rightArrowButtonIcon,
                            onTap: (){} //userNumberUp, // ToDo переписать, так как сейчас юзеры приходят не с сервера.
                          )
                        ),
                      ],
                    )
                  ]
                )
              ),
              /// Separator line.
              const SizedBox(
                height: 22
              ),
              /// List block.
              SizedBox(
                height: ((MediaQuery.of(context).size.height - 200) ~/ 36) * 36,
                child: Scrollbar(
                  thumbVisibility: true,
                  trackVisibility: true,
                  controller: _scrollControllerCategoriesBlock,
                  child: ListView.builder(
                    controller: _scrollControllerCategoriesBlock,
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.isEditable?
                      (widget.celebrations.length + 1):
                         widget.celebrations.length,
                    itemBuilder: (BuildContext context, int index) {
                      if(widget.isEditable && index == 0) {
                        return const EditableCelebrateRowWidget();
                      }
                      return CelebrateRowWidget(
                        index: index,
                        isChecked: (checkedCelebrateIndex == index),
                        name: widget.isEditable?
                          widget.celebrations[index - 1]:
                            widget.celebrations[index],
                        theme: widget.theme,
                        callback: () {}
                      );
                    }
                  )
                )
              ),
                /// Separator line.
                const SizedBox(
                  height: 10
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 16
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 46,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              widget.isEditable = !widget.isEditable;
                            });// sadfs
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(98, 198, 170, 0.1),
                                  Color.fromRGBO(68, 168, 140, 0.1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: const Color(0xFF52B69A),
                                width: 1,
                              ),
                            ),
                            child: const Text(
                              '+ Добавить праздник',
                              style: TextStyle(
                                fontFamily: 'Roboto600',
                                fontSize: 14,
                                color: Color(0xFF52B69A)
                              ),
                              textAlign: TextAlign.center,
                            )
                          )
                        )
                      )
                    ),
                    const SizedBox(
                      width: 8
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 46,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              widget.isEditable = !widget.isEditable;
                            });// sadfs
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(98, 198, 170, 0.1),
                                  Color.fromRGBO(68, 168, 140, 0.1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: const Color(0xFF52B69A),
                                width: 1,
                              ),
                            ),
                            child: const Text(
                              'Сохранить',
                              style: TextStyle(
                                fontFamily: 'Roboto600',
                                fontSize: 14,
                                color: Color(0xFF52B69A)
                              ),
                              textAlign: TextAlign.center,
                            )
                          )
                        )
                      )
                    ),
                    const SizedBox(
                      width: 16
                    )
                  ]
                ),
                const SizedBox(
                  height: 30
                )
                /// navBar. // ToDo
              ]
            )
          )
    );
  }
}

class CelebrateRowWidget extends StatefulWidget {

  final int index;
  final bool isChecked;
  final String name;
  // final int day;
  // final int month;
  final AppTheme theme;
  final Function callback;

  const CelebrateRowWidget({
    required this.index,
    required this.isChecked,
    required this.name,
    // required this.day,
    // required this.month,
    required this.theme,
    required this.callback,
    Key? key}
  ) : super(key: key);

  @override
  State<CelebrateRowWidget> createState() => _CelebrateRowWidgetState();
}

class _CelebrateRowWidgetState extends State<CelebrateRowWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (widget.index % 2 == 0)?
        const Color(0xFFFBFDFF):
        const Color(0xFFE3F3FD),
      child: InkWell(
        onTap: () {
          widget.callback();
        },
        child: Row(
          children: <Widget> [
            const SizedBox(
              width: 16,
              height: 36,
            ),
            if(widget.isChecked)
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF52B69A),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFF52B69A),
                    )
                  )
                ),
              ),
            if(!widget.isChecked)
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFA6ADB5),
                )
              ),
            const SizedBox(
              width: 8,
              height: 36,
            ),
            Expanded(
              child: Text(
                widget.name,
                style: TextStyle(
                  color: widget.isChecked? const Color(0xFF52B69A) : const Color(0xFF627684),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                )
              )
            ),
            // Text(
          //   "${widget.day.toString().padLeft(2, '0')}.${widget.month.toString().padLeft(2, '0')}",
          //   style: const TextStyle(
          //     color: Color(0xFFA6ADB5),
          //     fontSize: 14,
          //     fontFamily: 'Roboto',
          //   )
          // ),
            const SizedBox(
              width: 16,
              height: 1,
            )
          ]
        )
      )
    );
  }
}

class EditableCelebrateRowWidget extends StatefulWidget {

  const EditableCelebrateRowWidget ({Key? key}) : super(key: key);

  @override
  State<EditableCelebrateRowWidget> createState() => _EditableCelebrateRowWidgetState();
}

class _EditableCelebrateRowWidgetState extends State<EditableCelebrateRowWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFBFDFF),
      child: Row(
        children: <Widget> [
          const SizedBox(
            width: 16,
            height: 36,
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF52B69A),
                width: 2,
              ),
            ),
            child: Center(
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFF52B69A),
                )
              )
            ),
          ),
          const SizedBox(
            width: 8,
            height: 36,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 6),
              height: 36,
              child: TextField(
                autofocus: true,
                onChanged: (text){
                  // phone = "+7 $text";
                },
                style: const TextStyle(
                  color: Color.fromRGBO(65, 78, 88, 1),
                  fontSize: 14,
                  fontFamily: 'Roboto400'
                ),
                cursorColor: const Color.fromRGBO(65, 78, 88, 1),
                decoration: InputDecoration(
                  hintText: 'Ввод праздника',
                  hintStyle: TextStyle(
                    color: const Color.fromRGBO(166, 173, 181,1),
                    fontSize: 0.019*MediaQuery.of(context).size.height,
                    fontFamily: 'Roboto400'
                  ),
                  border: InputBorder.none
                )
              )
            )
          ),
          const SizedBox(
            width: 16,
            height: 1,
          )
        ]
      )
    );
  }
}

// class CircleCheckBox extends StatelessWidget {
//   bool is
//   CircleCheckBox({Key? key}) : super(key: key)
//
//   @override
//   Widget build(BuildContext context) {
//     if (value == groupValue) {
//       return Container()
//     }
//   }
// }
//
// class CustomRadio<T> extends StatelessWidget {
//
//   final ValueChanged<T?> onChanged;
//   final T value;
//   final T groupValue;
//
//   const CustomRadio({
//     required this.onChanged,
//     required this.value,
//     required this.groupValue,
//     Key? key
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     if (value == groupValue){
//       return Container(
//         width: 24,
//         height: 24,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(
//               color: AppTheme.mainGreenColor,
//               width: 2,
//             ),
//             color: AppTheme.backgroundColor
//         ),
//         child: Center(
//             child: Container(
//                 width: 16,
//                 height: 16,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: AppTheme.mainGreenColor,
//                 )
//             )
//         ),
//       );
//     }
//     return Listener(
//       child: Container(
//           height: 24,
//           width: 24,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(
//                 color: AppTheme.inactiveButtonBorderColor,
//                 width: 2,
//               ),
//               color: AppTheme.inactiveButtonFillColor
//           ),
//           child: Container(
//             margin: const EdgeInsets.all(2),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           )
//       ),
//       onPointerDown: (_) {onChanged(value);},
//     );
//   }
// }

class BendedLinePainter extends CustomPainter{
  final Color color;
  final double leftPadding;
  static const halfLineWidth = 2.0;
  static const roundingRadius = 5.0;

  const BendedLinePainter({
    required this.color,
    required this.leftPadding
  });

  @override
  void paint(Canvas canvas, Size size){

    print("сайз ${size.width}");
    final line = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = halfLineWidth * 2;

    canvas.drawLine(
        Offset(size.width, halfLineWidth),
        Offset((roundingRadius + leftPadding + halfLineWidth), halfLineWidth),
        line
    );
    canvas.drawArc(
        Rect.fromLTWH((leftPadding + halfLineWidth), halfLineWidth, 10, 10),
        (pi * 1.5),
        (-pi * 0.5),
        false,
        line
    );
    canvas.drawLine(
        Offset((leftPadding + halfLineWidth), (roundingRadius + halfLineWidth)),
        Offset((leftPadding + halfLineWidth), size.height),
        line
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return false;
  }
}