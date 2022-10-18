import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShowNumber(),
    );
  }
}

class ShowNumber extends StatefulWidget {
  ShowNumber({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowNumber> createState() => _ShowNumberState();
}

class _ShowNumberState extends State<ShowNumber> {
  @override
  int num1 = 0;
  int num2 = 0;
  int num3 = 0;
  List<ItemModel> neewGuss = [ItemModel(0, 0, false)];
  ItemModel correctNumber = ItemModel(0, -1, false);
  ItemModel selectdNumber = ItemModel(0, -1, false);
  Random random = Random();
  void fun1() {
    var first = 34;
    var second = 90;
    num1 = first + random.nextInt(second - first);
    ItemModel a = ItemModel(1, num1, false);
    setState(() {
      neewGuss.add(a);
    });
  }

  void fun2() {
    var first = 34;
    var second = 90;
    num2 = first + random.nextInt(second - first);
    ItemModel a = ItemModel(1, num2, false);
    setState(() {
      neewGuss.add(a);
    });
  }

  void fun3() {
    var first = 34;
    var second = 90;
    num3 = first + random.nextInt(second - first);
    ItemModel a = ItemModel(1, num3, false);
    setState(() {
      neewGuss.add(a);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text("Guessing Game"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: SizedBox(
              //width: 10,
              height: 50,
              child: MaterialButton(
                color: Colors.orangeAccent,
                child: Text(
                  "Restart",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  neewGuss = [];
                  correctNumber = ItemModel(0, -1, false);
                  fun1();
                  fun2();
                  fun3();
                  correctNumber = neewGuss[0 + random.nextInt(2)];
                },
              ),
            ),
          ),
          Column(
            children: neewGuss!.map((item) {
              return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectdNumber = item;
                        selectdNumber.isCorrect = correctNumber.num == item.num;
                      });
                    },
                    child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: item.num == selectdNumber.num
                                ? ((selectdNumber.isCorrect ?? false)
                                ? Colors.green
                                : Colors.red)
                                : Colors.black),
                        child: Center(
                          child: Text(
                            item.num.toString(),
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        )),
                  ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ItemModel {
  int? id;
  int? num;

  bool? isCorrect;

  ItemModel(this.id, this.num, this.isCorrect);
}