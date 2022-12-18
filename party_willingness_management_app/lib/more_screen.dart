import 'package:flutter/material.dart';

import 'database.dart';

final dbHelper = DatabaseHelper();

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  int a = 0;
  int b = 0;
  int c = 0;
  int d = 0;
  int e = 0;
  void initState() {
    // TODO: implement initState
    super.initState();
    _query();
    _queryMale();
    _queryFemale();
    _queryPaid();
    _queryUnpaid();
  }

  void _query() async {
    final allRows = await dbHelper.queryRowCount();
    setState(() {
      a = allRows;
    });
  }

  void _queryMale() async {
    final allRows = await dbHelper.queryRowMale();
    setState(() {
      b = allRows;
    });
  }

  void _queryFemale() async {
    final allRows = await dbHelper.queryRowFemale();
    setState(() {
      c = allRows;
    });
  }

  void _queryPaid() async {
    final allRows = await dbHelper.queryRowPaid();
    setState(() {
      d = allRows;
    });
  }

  void _queryUnpaid() async {
    final allRows = await dbHelper.queryRowUnPaid();
    setState(() {
      e = allRows;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.pink.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Total Students',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Text(
                                a.toString(),
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black54),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Total Boys',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Text(
                                b.toString(),
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black54),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Total Girls',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Text(
                                c.toString(),
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black54),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Paid Students',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Text(
                                d.toString(),
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black54),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Unpaid Students',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Text(
                                e.toString(),
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black54),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
