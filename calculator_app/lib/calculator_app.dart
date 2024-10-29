import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator_app/btn.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String userAsk = '';
  String userHint = '';
  String userAnswer = '';
  List<String> myBtn = [
    'AC',
    'Del',
    '%',
    '÷',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'Ans',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //! User Ask
              Container(
                height: 60,
                alignment: Alignment.centerLeft,
                color: Colors.blue[100],
                child: AutoSizeText(
                  userAsk,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
              //! User Hint
              Container(
                height: 60,
                alignment: Alignment.centerRight,
                color: Colors.blue[100],
                child:  AutoSizeText(
                  userHint,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
              //! User Answer
              Container(
                height: 60,
                alignment: Alignment.centerRight,
                color: Colors.blue[100],
                child:  AutoSizeText(
                  userAnswer,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ],
          )),
          Expanded(
            flex: 2,
            child: GridView.builder(
                itemCount: myBtn.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  //! AC Button
                  if (myBtn[index] == 'AC') {
                    return Button(
                      btnColor: Colors.amber,
                      btnText: myBtn[index],
                      textColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          userAsk = '';
                          userAnswer = '';
                          userHint = '';
                        });
                      },
                    );

                    // !Delete Button
                  } else if (myBtn[index] == 'Del') {
                    return Button(
                      btnColor: Colors.red,
                      btnText: myBtn[index],
                      textColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          if(userAsk.isNotEmpty){
                            userAsk = userAsk.substring(0,userAsk.length-1);
                          }
                        });
                      },
                    );

                    //!Sign Button
                  } else if (myBtn[index] == '%' ||
                      myBtn[index] == '÷' ||
                      myBtn[index] == 'x' ||
                      myBtn[index] == '-' ||
                      myBtn[index] == '+') {
                    return Button(
                      btnColor: Colors.blue,
                      btnText: myBtn[index],
                      textColor: Colors.black,
                      onPressed: () {
                        setState(() {
                          userAsk += myBtn[index];
                        });
                      },
                    );

                    //!Equal Button
                  } else if (myBtn[index] == '=') {
                    return Button(
                      btnColor: Colors.blue,
                      btnText: myBtn[index],
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          equal();
                          if(userAnswer.length == 1){
                            userHint = 'جايبني عشان دي يا تافه؟';
                          }
                          if(userAnswer.length>8){
                            userHint ='بتعجزني كدا مثلا؟☻☻';
                          }
                        });
                      },
                    );

                    //!All Button
                  } else {
                    return Button(
                      btnColor: Colors.grey.shade300,
                      btnText: myBtn[index],
                      textColor: Colors.black,
                      onPressed: () {
                          setState(() {
                          userAsk += myBtn[index];
                        });
                      },
                    );
                  }
                }),
          )
        ],
      ),
    );
  }

  void equal(){
 try{
     String finalAsk = userAsk;
    finalAsk = finalAsk.replaceAll('x', '*');
    finalAsk = finalAsk.replaceAll('÷', '/');
    Parser p = Parser();
    Expression exp = p.parse(finalAsk);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
 }catch(e){
  if(userAsk.endsWith('÷')){
    userHint = 'نسيت هتقسم ايه ';
    userAnswer = '';
  }else if(userAsk.endsWith('x')){
    userHint = 'نسيت هتضرب ايه ';
    userAnswer = '';
  }else if(userAsk.endsWith('-')){
    userHint = 'عندي السكر ☺ ناقص ايه؟';
    userAnswer = '';
  }else if(userAsk.endsWith('+')){
    userHint = '   جالي الضغط .. هتجمع ايه؟';
    userAnswer = '';
  }
  else{
    userAnswer = 'ERROR';
  }
 }
  }
}
