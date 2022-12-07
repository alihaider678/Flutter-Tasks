import 'dart:math';

import 'package:ali/screens/todo_list_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key, required this.table, required this.rand});
  int table;
  int rand;
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int checkTrue = -1;
  int a = 1;
  Color checkSubmission() {
    if (checkTrue == 0) {
      return Colors.red;
    }
    if (checkTrue == 1) {
      return Colors.blue;
    }
    return Colors.transparent;
  }

  int generateRandom(List<int> list) {
    int rnd = 1 + Random().nextInt(10 - 1);
    return list.contains(rnd) ? generateRandom(list) : rnd;
  }

  late List<int> list = [];
  void setSetInitial() {
    list = [widget.rand];
    list.add(generateRandom(list));
    list.add(generateRandom(list));
    list.add(generateRandom(list));
  }

  @override
  void initState() {
    setSetInitial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Table Quiz',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(
                  color: Colors.orangeAccent.shade100,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                  child: Text(
                "${widget.table} x ${widget.rand} = ___",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              )),
            ),
            Container(
              width: 200,
              height: 200,
              padding: EdgeInsets.all(20.0),
              child: GridView.builder(
                itemCount: list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.orangeAccent.shade100,
                        borderRadius: BorderRadius.circular(30)),
                    child: TextButton(
                      onPressed: () {
                        print("Submission " +
                            (list[index] * widget.rand).toString());
                        print("Actual " +
                            (list[index] * widget.table).toString());
                        if ((list[index] * widget.table) ==
                            widget.table * widget.rand) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Your answer is Correct.")));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Your answer is Wrong. Correct Answer is ${widget.table * widget.rand}"),
                            ),
                          );
                        }
                      },
                      child: Text(
                        (widget.table * list[index]).toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Generate New Table",
                      style: TextStyle(color: Colors.blue.shade900),
                    ),
                  ),
                ),
                a != 10
                    ? Container(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              a++;
                              widget.rand = 1 + Random().nextInt(10 - 1);
                            });
                            setSetInitial();
                          },
                          child: Text("Next Question",
                          style: TextStyle(color: Colors.blue.shade900),
                          ),
                        ),
                      )
                    : Container(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ToDoListScreen(
                                        st: widget.rand.toString(),
                                      )),
                            );
                          },
                          child: Text("Show result",
                          style: TextStyle(color: Colors.blue.shade900),),
                        ),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
