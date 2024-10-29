import 'package:flutter/material.dart';
import 'package:workshop/core/constants/colors.dart';
import 'package:workshop/widgets/starter_app_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All In One',
      style: TextStyle(
        color: AppColor.white
      ),
      ),
      backgroundColor: AppColor.black,
      ),
      backgroundColor: AppColor.bg,
      body:  SafeArea(child: Padding(padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //! Remove the comment then add arguments 
          StarterAppItem(
            image: 'lib/core/assets/images/lighter.png',
            text: 'Lighter',
            iconData: Icons.play_arrow,
            onPressed: () {
              Navigator.pushNamed(context, '/lighter');
            }
          ),
          StarterAppItem(
            image: 'lib/core/assets/images/calc.jpg',
            text: 'Calculator',
            iconData: Icons.play_arrow,
            onPressed: () {
              Navigator.pushNamed(context, '/calculator');
            },
          ),
          StarterAppItem(
            image: 'lib/core/assets/images/xo.png',
            text: 'Xo',
            iconData: Icons.play_arrow,
            onPressed: () {
              Navigator.pushNamed(context, '/xo');
            }
          ),
          StarterAppItem(
            image: 'lib/core/assets/images/basket.png',
            text: 'Counter',
            iconData: Icons.play_arrow,
            onPressed: () {
              Navigator.pushNamed(context, '/basket');
            }
          ),
        ],
      ),
      )),
    );
  }
}