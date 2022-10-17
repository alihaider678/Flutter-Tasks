import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GameView extends StatefulWidget {
  GameView({super.key, this.level = 1});
  int level;
  var l1 = [];
  var l2 = [];
  int score = 0;
  bool isLeftClicked = false;
  int leftPoint = -1;
  int tries = 3;
  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  void generateOnce() {
    widget.score = 0;
    widget.tries = 3;
    widget.leftPoint = -1;
    widget.isLeftClicked = false;

    widget.l1 = List.generate(widget.level * 5, (_) => _+1);
    widget.l2.clear();
    widget.l1.shuffle();
    widget.l2.addAll(widget.l1);
    widget.l2.shuffle();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.l1.isEmpty) {
      generateOnce();
      setState(() {});
    }
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue.shade600,
          child: Column(
            children: [
              Padding(
                padding:EdgeInsets.only(top: size.height*0.1),
                child: Text("Level ${widget.level}",
                  style:TextStyle(
                    fontSize: size.width*0.1,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,                  ),
                ),
              ),
              Text("Tries Left ${widget.tries}",
                style:TextStyle(
                  fontSize: size.width*0.06,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.05,right: size.width*0.05,top: size.height*0.05 ),
                    child: Container(
                      width: size.width*0.39,
                      height: size.height*0.9,
                      child: ListView.builder(
                        itemCount: widget.l1.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: size.height*0.05,left: size.height*0.01),
                                child: Container(
                                  width: size.width*0.35,
                                  height: size.height*0.09,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.white),
                                    ),
                                    onPressed: () {
                                      print(index);
                                      widget.isLeftClicked = !widget.isLeftClicked;
                                      widget.leftPoint = widget.l1[index];
                                      setState(() {});
                                    },
                                    child: Image.asset('assets/gamepics/${widget.l1[index]}.jpeg'),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(right: size.width*0.05,top: size.height*0.05 ),
                      child: Container(
                        width: size.width*0.39,
                        height: size.height*0.9,
                        child: ListView.builder(
                          itemCount: widget.l2.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: size.height*0.05,left: size.height*0.01),
                                  child: Container(
                                    width: size.width*0.35,
                                    height: size.height*0.09,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.black),
                                      ),
                                      onPressed: () {
                                        print(index);
                                        if (widget.isLeftClicked) {
                                          if (widget.leftPoint == widget.l2[index]) {
                                            widget.score++;
                                            widget.l1.remove(widget.leftPoint);
                                            widget.l2.remove(widget.leftPoint);
                                          } else {
                                            widget.tries--;
                                          }
                                          widget.leftPoint = -1;
                                          widget.isLeftClicked = false;
                                          setState(() {});

                                          if (widget.tries == 0) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(
                                                    content:
                                                    Text("Out of tries. Game Over")));
                                            Navigator.pop(context);
                                            //generateOnce();
                                          }
                                          if (widget.score == widget.level * 5) {
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                content: Text(
                                                    "Level ${widget.level} Cleared. ")));
                                            widget.level = widget.level + 1;
                                            if(widget.level>2) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Game Completed")));
                                              Navigator.pop(context);
                                            }
                                            generateOnce();
                                          }
                                        }
                                      },
                                      child: Text(
                                        " ${widget.l2[index]}",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}