import 'package:flutter/material.dart';
import './display.dart';
class Select extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SelectState();
  }

}

class SelectState extends State<Select> {

  int init=0,fin=0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Initial Value :",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.orangeAccent
                  ),
                ),

                Container(
                  child: Slider(
                    value: init.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        this.init = value.toInt();
                        print(init);
                      });
                    },
                    min: 0,
                    max: 100,
                    divisions: 100,
                  ),
                  padding: EdgeInsets.only(left: 30,right: 30),
                ),

                Text(
                  init.toString(),
                  style: TextStyle(
                      fontSize: 25.0
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Colors.black
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Final Value :",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.orangeAccent
                  ),
                ),

                Container(
                  child: Slider(
                    value: fin.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        this.fin = value.toInt();
                        print(fin);
                      });
                    },
                    min: 0,
                    max: 100,
                    divisions: 100,
                  ),
                  padding: EdgeInsets.only(left: 30,right: 30),
                ),

                Text(
                  fin.toString(),
                  style: TextStyle(
                      fontSize: 25.0
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            width: 200,
            height: 60,
            child: ElevatedButton(
              // color: Colors.amber,
              // child: Text(
              //   "Let's GO !!"
              // ),
              // shape: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(15)
              // ),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) {
                  if(init<fin)
                    return Display(i:init,f: fin);
                  return Display(i:fin,f: init);
                }));
              },
            ),
          )
        ],
      )
    );
  }

}