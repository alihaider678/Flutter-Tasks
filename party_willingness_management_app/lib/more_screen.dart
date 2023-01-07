import 'package:flutter/material.dart';

import 'database.dart';
import 'generated/number_model.dart';

final dbHelper = DatabaseHelper();

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  int fees = 1500;
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

  TextEditingController _updatenumber = TextEditingController();
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

  List<modelnumber> _numberList = [];

  getnumber() async {
    var users = await dbHelper.queryAllnumber();

    users.forEach((user) {
      setState(() {
        var modelPass = modelnumber();
        modelPass.id = user['id'];
        modelPass.number = user['num'];
        _numberList.add(modelPass);
      });
    });
    setState(() {
      fees = _numberList.last.number ?? 1500;
    });
  }

  Widget build(BuildContext context) {
    final result = d.bitLength * fees;
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
                  Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Paid fees",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "DIN Alternate",
                                    fontSize: 20),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Text(
                                    fees.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "Cochin",
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Center(
                                                  child: Text('Update Number')),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextField(
                                                    controller: _updatenumber,
                                                    decoration: InputDecoration(
                                                        prefixText:
                                                        "Update Number: "),
                                                  ),
                                                ],
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () async {
                                                    if (_updatenumber
                                                        .text.isNotEmpty) {
                                                      print('Good');
                                                      var mo = modelnumber();

                                                      mo.number = int.parse(
                                                          _updatenumber.text);
                                                      var result =
                                                      await dbHelper
                                                          .SaveNumber(mo);

                                                      if (result != null) {
                                                        const snackBar =
                                                        SnackBar(
                                                          content: Text(
                                                              'Save Data Successfully'),
                                                        );
                                                        ScaffoldMessenger.of(
                                                            context)
                                                            .showSnackBar(
                                                            snackBar);
                                                      } else {
                                                        const snackBar =
                                                        SnackBar(
                                                          content: Text(
                                                              'Somthing went wrong'),
                                                        );
                                                        ScaffoldMessenger.of(
                                                            context)
                                                            .showSnackBar(
                                                            snackBar);
                                                      }
                                                    } else {
                                                      const snackBar = SnackBar(
                                                        content: Text(
                                                            'Please Fill All Field'),
                                                      );
                                                      ScaffoldMessenger.of(
                                                          context)
                                                          .showSnackBar(
                                                          snackBar);
                                                    }
                                                  },
                                                  child: Text(
                                                    'Update',
                                                    style: TextStyle(
                                                        color: Colors.pink),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        color: Colors.teal),
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total Collection",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "DIN Alternate",
                                    fontSize: 20),
                              ),
                              Spacer(),
                              Text(
                                "Rs.$result",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Cochin",
                                    fontSize: 16),
                              ),
                            ],
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
