import 'package:flutter/material.dart';
import 'package:xo_app/btn.dart';

class XoApp extends StatefulWidget {
  const XoApp({super.key});

  @override
  State<XoApp> createState() => _XoAppState();
}

class _XoAppState extends State<XoApp> {
  @override
  Widget build(BuildContext context) {
    return const XoHomePage();
  }
}

class XoHomePage extends StatefulWidget {
  const XoHomePage({super.key});

  @override
  State<XoHomePage> createState() => _XoHomePageState();
}

class _XoHomePageState extends State<XoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: _body(context),
    );
  }
















  Container _body(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.deepPurpleAccent,
        Color.fromARGB(255, 95, 80, 121)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          const Text(
            'XO GAME',
            style: TextStyle(fontSize: 60, fontFamily: 'frist'),
          ),
          const Text(
            'TIC TAC TOE',
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'second'),
          ),
          const SizedBox(
            height: 70,
          ),
          Image.asset(
            'lib/core/assets/images/xo.png',
            height: 300,
          ),
           const SizedBox(
            height: 50,
          ),
          Btn(
            data: 'Play VS Friend',
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Friend()));
              Navigator.pushNamed(context , '/friend');
            },
          ),
           const SizedBox(
            height: 20,
          ),
          Btn(data: 'Play VS Computer', onPressed: () {
             Navigator.pushNamed(context , '/computer');
          })
        ],
      ),
    );
  }
}
