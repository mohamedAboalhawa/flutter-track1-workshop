import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color? btnColor;
  final String btnText;
  final Color? textColor;
  final void Function()? onPressed;
  const Button({
    super.key,
    required this.btnColor,
    required this.btnText,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: MaterialButton(
          color: btnColor,
          shape: const CircleBorder(),
          onPressed: onPressed,
          child: Text(
            btnText,
            style: TextStyle(
              fontSize: 32,
              color: textColor,
            ),
          )),
    );
  }
}
