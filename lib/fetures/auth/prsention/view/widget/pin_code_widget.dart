import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeWidget extends StatelessWidget {
  final int length;
  final void Function(String)? onCompleted;
  const PinCodeWidget({required this.length, this.onCompleted});
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: length,
      animationCurve: Curves.bounceOut,
      autoFocus: true,
      autovalidateMode: AutovalidateMode.always,
      onCompleted: onCompleted,
    );
  }
}
