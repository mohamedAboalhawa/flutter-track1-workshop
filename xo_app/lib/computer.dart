import 'package:flutter/material.dart';

class Computer extends StatelessWidget {
  const Computer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Coming Soon',style: TextStyle(
          fontSize: 50,
          
        ),),
      ),
    );
  }
}
