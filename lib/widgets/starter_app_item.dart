import 'package:flutter/material.dart';

class StarterAppItem extends StatelessWidget {
  final String image;
  final String text;
  final IconData iconData;
  final void Function()? onPressed;
  const StarterAppItem(
      {super.key,
      required this.iconData,
      required this.image,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(image,fit: BoxFit.contain,),
            Text(text),
            IconButton(onPressed: onPressed,icon:Icon(iconData) ,),
          ],
        ),
      ),
    );
  }
}
