import 'package:flutter/material.dart';

void main() {
  runApp(Quizz());
}

class Quizz extends StatefulWidget {
  @override
  _QuizzState createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  bool flag = false;
  String str = 'Start Quiz';

  int quesNumber=0;
  List<Icon>scoreKeeper=[];
  List<String>question=[
    'Capital of India is Kolkata',
    'India won 2013 world cup',
    'Covid Vaccine is very Harmful',
    'PM of India is Narinder Modi'
  ];
  List<bool>answers=[
    false,
    false,
    false,
    true,
  ];

  Expanded ansButton(String s,Color c,bool res){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(onPressed: (){

          if(res==answers[quesNumber])
            scoreKeeper.add(Icon(Icons.check,color: Colors.black,));
          else
            scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
          setState(() {
            quesNumber++;
          });
        }, child: Text('$s',style: TextStyle(color: Colors.white,fontSize: 20),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(c)),),
      ),
    );
  }

  Column startQuiz() {
    if (flag) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  question[quesNumber]+' ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

            ansButton('True',Colors.red,true),
            ansButton('False',Colors.green,false),
          Row(
            children: scoreKeeper,
          )

        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Press Start Quiz',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),


        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    flag = !flag;
                    if (flag)
                      str = 'Solve Question';
                    else
                      str = 'Start Quiz';
                  });
                },
                child: Text(
                  '$str',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            backgroundColor: Colors.teal.shade200,
          ),
          backgroundColor: Colors.teal,
          body: startQuiz()),
    );
  }
}
