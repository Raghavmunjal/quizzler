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
  List<Icon>scoreKeeper=[];

  Expanded ansButton(String s,Color c){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(onPressed: (){
          setState(() {
            if(s=='True')
              scoreKeeper.add(Icon(Icons.check,color: Colors.black,));
            else
              scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
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
                  'This is were Question text will go',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ),

            ansButton('True',Colors.red),
            ansButton('False',Colors.green),
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
