import 'dart:math';

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
        title: Text('Table Quiz',
          style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Text("${widget.table} x ${widget.rand} = ___"),
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
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Generate New Table"),
                  ),
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        widget.rand = 1 + Random().nextInt(10 - 1);
                      });
                      setSetInitial();
                    },
                    child: Text("Next Question"),
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
