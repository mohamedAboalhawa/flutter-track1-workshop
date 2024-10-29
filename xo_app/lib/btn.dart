import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final String data;
  final void Function()? onPressed;
  const Btn({
    required this.data,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: const ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size(290, 50)),
        ),
        onPressed: onPressed,
        child: Text(
          data,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'second'),
        ));
  }
}
