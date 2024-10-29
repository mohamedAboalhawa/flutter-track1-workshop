// ignore_for_file: prefer_const_constructors
import 'package:basket_app/btn.dart';
import 'package:flutter/material.dart';

class BasketAppScreen extends StatefulWidget {
  const BasketAppScreen({super.key});

  @override
  State<BasketAppScreen> createState() => _BasketAppScreenState();
}
enum TeamType{
  teamA,teamB
}

class _BasketAppScreenState extends State<BasketAppScreen> {
  int teamAPoints = 0;
  int teamBPoints = 0;

  void increasePoint(int points, TeamType teamType) {
    setState(() {
      if (teamType == TeamType.teamA) {
        teamAPoints += points;
      } else if (teamType == TeamType.teamB) {
        teamBPoints += points;
      }
    });
  }

  void resetPoint() {
    setState(() {
      teamAPoints = 0;
      teamBPoints = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Points Counter'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Team A',
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                  Text(
                    '$teamAPoints',
                    style: TextStyle(fontSize: 150, color: Colors.black),
                  ),
                  Column(
                    children: [
                      PointsBtn(
                        data: 'Add 1 point',
                        onPressed: () => increasePoint(1,TeamType.teamA),

                      ),
                      SizedBox(
                        height: 16,
                      ),
                      PointsBtn(
                        data: 'Add 2 point',
                        onPressed: () => increasePoint(2,TeamType.teamA),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      PointsBtn(
                        data: 'Add 3 point',
                        onPressed: () => increasePoint(3,TeamType.teamA),

                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 400,
                child: VerticalDivider(
                  thickness: 1,
                  width: 10,
                  color: Colors.grey,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Team B',
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                  Text(
                    '$teamBPoints',
                    style: TextStyle(fontSize: 150, color: Colors.black),
                  ),
                  Column(
                    children: [
                      PointsBtn(
                        data: 'Add 1 point',
                        onPressed: () => increasePoint(1,TeamType.teamB),

                      ),
                      SizedBox(
                      height: 16,
                    ),
                      PointsBtn(
                        data: 'Add 2 point',
                        onPressed: () => increasePoint(2,TeamType.teamB),
                      ),
                      SizedBox(
                      height: 16,
                    ),
                      PointsBtn(
                        data: 'Add 3 point',
                        onPressed: () => increasePoint(3,TeamType.teamB),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 62,
          ),
          MaterialButton(
            color: Colors.orange,
            onPressed: resetPoint,
            child: Text('Rest'),),
            Spacer(),
        ],
      ),
    );
  }
  

  
}