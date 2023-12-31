part of 'models.dart';

class CustomTextField extends StatelessWidget {
  final double height;
  final double width;
  final int? maxLines;
  final String? hintText;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final TextAlignVertical? textAlignVertical;

  const CustomTextField({
    super.key,
    required this.height,
    required this.width,
    this.maxLines,
    this.hintText,
    this.controller,
    this.onChanged,
    this.textAlignVertical,
  });

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlinedBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: const Color.fromRGBO(66, 68, 77, 1),//context.read<ThemeBloc>().state.postcardContainerBorderColor,
        width: 1.2,
      ),
    );
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        expands: true,
        style: TextLocalStyles.roboto400.copyWith(
          color: const Color.fromRGBO(166, 173, 181, 1),
          fontSize: getHeight(context, 16),
        ),
        cursorColor: const Color.fromRGBO(166, 173, 181, 1),
        maxLines: null,
        textAlignVertical: textAlignVertical ?? TextAlignVertical.top,
        decoration: InputDecoration(
          border: outlinedBorder.copyWith(borderRadius: BorderRadius.circular(4)),
          focusedBorder: outlinedBorder.copyWith(borderRadius: BorderRadius.circular(4)),
          enabledBorder: outlinedBorder.copyWith(borderRadius: BorderRadius.circular(4)),
          hintText: hintText,
          hintStyle: TextLocalStyles.roboto400.copyWith(
            color: const Color.fromRGBO(166, 173, 181, 1),
            fontSize: getHeight(context, 16),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getWidth(context, 10),
            vertical: getHeight(context, 15),
          ),
          filled: true,
          fillColor: const Color.fromRGBO(52, 54, 62, 1),//context.read<ThemeBloc>().state.dockColor,
        ),
      ),
    );
  }
}
