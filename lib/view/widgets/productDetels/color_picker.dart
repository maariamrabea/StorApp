import 'package:flutter/cupertino.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker(
      {super.key, required this.outerBorder, required this.color});

  final bool outerBorder;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: outerBorder ? Border.all(color: color, width: 2) : null),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
