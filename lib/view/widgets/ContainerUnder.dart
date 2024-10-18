import 'package:flutter/material.dart';
import 'package:stor_app/view/widgets/text.dart';

class ContainerUnder extends StatelessWidget {
  const ContainerUnder({super.key, required this.text, required this.onPressed, required this.textt});

  final String text;
  final String textt;

  final Function()onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(29),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: text,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            underLine: TextDecoration.none,
            color: Colors.white,
          ),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
              text: textt,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              underLine: TextDecoration.underline,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
