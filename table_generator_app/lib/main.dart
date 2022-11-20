import 'dart:math';
import 'package:flutter/material.dart';
import 'package:table_generator_app/quiz.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  double table = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Table Generator App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Select Table"),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Slider(
                min: 1,
                max: 100,
                value: table,
                onChanged: (val) => setState(
                  () {
                    table = val;
                  },
                ),
              ),
            ),
            Container(
              width: 100,
              height: 200,
              child: table > 0
                  ? ListView.builder(
                      itemCount: table > 0 ? 10 : 0,
                      itemBuilder: (context, index) => Text(
                          "${table.toInt().toString()} x ${index + 1} = ${table.toInt() * (index + 1)}"),
                    )
                  : Text(""),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Quiz(
                              table: table.toInt(),
                              rand: 1 + Random().nextInt(10 - 1),
                            )),
                  );
                },
                child: Text("Take Quiz"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
