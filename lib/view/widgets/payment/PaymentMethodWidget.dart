import 'package:flutter/material.dart';
import 'package:stor_app/view/widgets/text.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({super.key});

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int radioPayMentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          buildRadioPayment(
              image: 'image/paypal.png',
              scale: 0.7,
              name: 'Paypal',
              value: 1,
              onChange: (int? value) {
                setState(() {
                  radioPayMentIndex = value!;
                });
              }),
          const SizedBox(
            height: 15,
          ),
          buildRadioPayment(
              image: 'image/google.png',
              scale: 0.8,
              name: 'Google',
              value: 2,
              onChange: (int? value) {
                setState(() {
                  radioPayMentIndex = value!;
                });
              }),
          const SizedBox(
            height: 15,
          ),
          buildRadioPayment(
              image: 'image/credit.png',
              scale: 0.8,
              name: 'Paypal',
              value: 3,
              onChange: (int? value) {
                setState(() {
                  radioPayMentIndex = value!;
                });
              })
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              TextUtils(
                  text: name,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  underLine: TextDecoration.none)
            ],
          ),
          Radio(
              value: value,
              fillColor:
                  MaterialStateColor.resolveWith((states) => Colors.teal),
              groupValue: radioPayMentIndex,
              onChanged: (int? value) {
                onChange(value);
              })
        ],
      ),
    );
  }
}
