
import 'package:flutter/material.dart';

class PointsBtn extends StatelessWidget {
  final void Function()? onPressed;
  final String data;
  const PointsBtn({
    required this.data,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.orange,
      onPressed: onPressed, child: Text(data));
  }
}