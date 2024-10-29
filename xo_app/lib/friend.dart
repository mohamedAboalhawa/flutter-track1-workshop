import 'dart:async';

import 'package:flutter/material.dart';

class Friend extends StatefulWidget {
  const Friend({super.key});

  @override
  State<Friend> createState() => _FriendState();
}

class _FriendState extends State<Friend> {
  List square = ['', '', '', '', '', '', '', '', ''];
  String frist = 'X';
  int xScore = 0, oScore = 0, drawScore = 0;
  bool isPlay = true;
  bool isWin = false;
  String winnerPlayer = '';
  getWinner() {
    List winerIndex = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (int i = 0; i < winerIndex.length; i++) {
      String a = square[winerIndex[i][0]];
      String b = square[winerIndex[i][1]];
      String c = square[winerIndex[i][2]];
      if (a == b && b == c && a != '') {
        return a;
      }
    }
    if (!square.contains('')) {
      return 'Draw';
    }
    return '';
  }

  clearBoard() {
    setState(() {
      for (int i = 0; i < square.length; i++) {
        square[i] = '';
      }
    });
  }

  Timer? timer;
  startTimer() {
    setState(() {
      isPlay = false;
      isWin = true;
    });
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        clearBoard();
        setState(() {
          isPlay = true;
          isWin = false;
        });

        timer.cancel();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Container _body(BuildContext context) {
    return container(context);
  }

  Container container(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              row1(context),
              const SizedBox(
                height: 10,
              ),
              row2(),
              const SizedBox(
                height: 10,
              ),
              Text(
                '$frist To Play',
                style: const TextStyle(
                  fontSize: 25,
                  fontFamily: 'second',
                  fontWeight: FontWeight.bold,
                ),
              ),
              gridView(),
            ],
          ),
          if (isWin)
            Center(
              child: Container(
                height: 180,
                width: double.infinity,
                color: Colors.black,
                child: Center(
                  child: Text(
                    winnerPlayer == 'Draw' ? 'Draw' : '$winnerPlayer is win',
                    style: const TextStyle(
                      fontSize: 70,
                      color: Colors.white,
                      fontFamily: 'frist',
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Padding gridView() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 450,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 0, crossAxisSpacing: 0),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                if (square[index] == '' && isPlay) {
                  if (frist == 'X') {
                    square[index] = 'X';
                    winnerPlayer = getWinner();
                    if (winnerPlayer == 'X') {
                      xScore++;
                      frist = 'X';
                      startTimer();
                    } else if (winnerPlayer == 'O') {
                      oScore++;
                      frist = 'O';
                      startTimer();
                    } else if (winnerPlayer == 'Draw') {
                      drawScore++;
                      startTimer();
                    } else {
                      frist = 'O';
                    }
                  } else {
                    square[index] = 'O';
                    winnerPlayer = getWinner();
                    if (winnerPlayer == 'X') {
                      xScore++;
                      frist = 'X';
                      startTimer();
                    } else if (winnerPlayer == 'O') {
                      oScore++;
                      frist = 'O';
                      startTimer();
                    } else if (winnerPlayer == 'Draw') {
                      drawScore++;
                      startTimer();
                    } else {
                      frist = 'X';
                    }
                  }
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 5),
              ),
              child: Center(
                child: Text(
                  square[index],
                  style: const TextStyle(
                    fontSize: 50,
                    fontFamily: 'frist',
                  ),
                ),
              ),
            ),
          ),
          itemCount: square.length,
        ),
      ),
    );
  }

  Row row2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 200,
          width: 120,
          decoration: BoxDecoration(
            color: (frist == 'X')
                ? const Color.fromARGB(255, 245, 157, 151)
                : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Text(
                'X',
                style: TextStyle(
                  fontSize: 60,
                  fontFamily: 'frist',
                  color:
                      (frist == 'X') ? Colors.black : Colors.deepPurpleAccent,
                ),
              ),
              Text(
                'Score',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'frist',
                  color:
                      (frist == 'X') ? Colors.black : Colors.deepPurpleAccent,
                ),
              ),
              Text(
                '$xScore',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'second',
                  color:
                      (frist == 'X') ? Colors.black : Colors.deepPurpleAccent,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          height: 60,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              'Draw:$drawScore',
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'second',
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          height: 200,
          width: 120,
          decoration: BoxDecoration(
            color: (frist == 'O')
                ? const Color.fromARGB(255, 245, 157, 151)
                : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Text(
                'O',
                style: TextStyle(
                  fontSize: 60,
                  fontFamily: 'frist',
                  color:
                      (frist == 'O') ? Colors.black : Colors.deepPurpleAccent,
                ),
              ),
              Text(
                'Score',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'frist',
                  color:
                      (frist == 'O') ? Colors.black : Colors.deepPurpleAccent,
                ),
              ),
              Text(
                '$oScore',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'second',
                  color:
                      (frist == 'O') ? Colors.black : Colors.deepPurpleAccent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row row1(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 35,
            )),
        const Spacer(),
        const Text(
          'VS Friend',
          style: TextStyle(fontSize: 40, fontFamily: 'frist'),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              setState(() {
                clearBoard();
                xScore = 0;
                oScore = 0;
                drawScore = 0;
                frist = 'X';
              });
            },
            icon: const Icon(
              Icons.restart_alt_outlined,
              color: Colors.white,
              size: 35,
            )),
      ],
    );
  }
}
