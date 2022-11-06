import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
int correct=0;
int wrong=0;
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue.shade900,
          title:Text(
            'Quiz Generate App',
            style: TextStyle(color: Colors.white,),
          ),
        ),
        body: start(),
    ),
    );
  }
}
class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);


  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  // var to store
// onChanged callback
  final fieldText = TextEditingController();
  String   questionText="";
  bool  questionAnswer=true;
  int c=0;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(//<-- SEE HERE
        child: Container(
          //color: Colors.yellow,
            child:Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: 200,
                  child: Text("Make Question Paper \n Total Question: 5",textAlign: TextAlign.center,style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Open Sans',
                      fontSize: 15),),),
                SizedBox(
                  height: 30,
                ),
                SizedBox( // <-- SEE HERE
                  width: 600,
                  child: TextField(
                    controller: fieldText,
                    decoration: InputDecoration(
                      labelText: 'Enter your Choice',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed:(){
                            fieldText.clear();
                          },
                          icon: const Icon(Icons.clear_rounded)
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height:100, //height of button
                  width:300, //width of button
                  child: ElevatedButton(
                      onPressed: (){
                        questionAnswer=true;
                        questionText=fieldText.text;
                        quizBrain.insertquestion(questionText,questionAnswer);
                        fieldText.clear();
                        c++;
                        if(c==5){
                          Alert(
                            context: context,
                            title: 'Success!',
                            desc: 'You\'ve enterd five question?',
                          ).show();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  QuizPage()),
                          );
                        }
                      },
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(8),
                          backgroundColor: MaterialStateProperty.all(Colors.green)),
                      child: const Text('True')),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height:100, //height of button
                  width:300, //width of button
                  child: ElevatedButton(
                      onPressed: (){
                        questionAnswer=false;
                        questionText=fieldText.text;
                        quizBrain.insertquestion(questionText,questionAnswer);
                        fieldText.clear();
                        c++;
                        if(c==5){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  QuizPage()),
                          );
                        }
                      },
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(8),
                          backgroundColor: MaterialStateProperty.all(Colors.red)),
                      child: const Text('False')),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )
        )
    );
  }
}


class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool? correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (quizBrain.isFinished() == true) {
        //TODO Step 4 Part A - show an alert using rFlutter_alert
        // ,
        if (userPickedAnswer == correctAnswer) {
          correct++;
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          wrong++;
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }

        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
        AlertDialog alert = AlertDialog(
          title: Text("Correct Answser  :$correct"),
          content: Text("Wrong Answer :$wrong"),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('OK',),
            ),
          ],
        );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scoreKeeper = [];
        correct=0;
        wrong=0;
      }

      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
      else {
        if (userPickedAnswer == correctAnswer) {
          correct++;
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          wrong++;
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.blue.shade900,
              title:Text(
                'Quiz Generate App',
                style: TextStyle(color: Colors.white,),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(top:20),
              child: Center(
                child: Container(
                  //color: Colors.amber,
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                          child:Column(
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:[
                                    Center(
                                      child: Text(
                                        //quizBrain.getQuestionText(),
                                        //getQuestion!,
                                        quizBrain.getQuestionText().toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          color: Colors.blue.shade900,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:100, //height of button
                                      width:300,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.green, // Background Color
                                        ),
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        onPressed: () {
                                          quizBrain.getQuestionText().toString();
                                          //The user picked true.
                                          checkAnswer(true);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),

                                    SizedBox(
                                      height:100, //height of button
                                      width:300,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.red, // Background Color
                                        ),
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          quizBrain.getQuestionText().toString();
                                          //The user picked false.
                                          checkAnswer(false);
                                        },
                                      ),
                                    ),

                                    SizedBox(
                                      height: 100,
                                    ),
                                    Row(
                                      children: scoreKeeper,
                                    )
                                  ],
                                ),
                              ]
                          )
                      )
                  ),
                ),
              ),
            ),
        )
    );
  }
}



