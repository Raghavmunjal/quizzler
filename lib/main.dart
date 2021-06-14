import 'package:flutter/material.dart';
import 'package:quizzler/quizBrain.dart';


QuizBrain qb=QuizBrain();


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
  int count=0;
  int quesNumber=0;
  List<Icon>scoreKeeper=[];






  Expanded ansButton(String s,Color c,bool res){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(onPressed: (){

          setState(() {

            if(res==qb.getQuestionAnswer(quesNumber)){
              scoreKeeper.add(Icon(Icons.check,color: Colors.black,));
              count=count+1;
            }else{
              scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
            }

              quesNumber++;

              if(quesNumber==qb.questionBank.length){
                quesNumber=0;

                flag=false;

                str='Try Again';

                scoreKeeper=[];

              }


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
                  qb.getQuestionText(quesNumber)+'?',
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Divider(
                height: 5,
                thickness: 5,
                endIndent: 40,
                indent: 40,
              ),
            ),
          Center(
            child: Text(
              'Last Score'+' : '+'$count',
              style: TextStyle(fontSize: 25, color: Colors.white),
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
                    else{
                      str = 'Start Quiz';
                    }

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
