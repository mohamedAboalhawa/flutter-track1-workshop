// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LighterScreen extends StatefulWidget {
  const LighterScreen({super.key});

  @override
  State<LighterScreen> createState() => _LighterScreenState();
}

bool switcher = false;

class _LighterScreenState extends State<LighterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lightbulb,
              color: switcher ? Colors.red : Colors.grey,
              size: 100,
            ),
            const SizedBox(
              height: 50,
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                setState(() {
                  switcher = !switcher;
                });
              },
              child: Text(
                switcher ? 'off' : 'on',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
