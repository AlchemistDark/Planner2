part of 'models.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: getHeight(context, 24),
          width: getWidth(context, 24),
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromRGBO(87, 99, 107, 1),// : const Color.fromRGBO(237, 244, 251, 1),
            ),
            child: Center(
              child: SvgPicture.asset('assets/svg/more_button.svg'// : 'assets/svg/more_button_light.svg',
              ),
            ),
          ),
        );
      // }
    // );
  }
}
