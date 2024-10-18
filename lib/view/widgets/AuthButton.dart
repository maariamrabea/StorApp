import 'package:flutter/material.dart';
import 'package:stor_app/view/widgets/text.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.text, required this.onPressed});

  final String text;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal, minimumSize: const Size(360, 50)),
      child:  TextUtils(
        text: text,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        underLine: TextDecoration.none,
      ),
    );
  }
}
