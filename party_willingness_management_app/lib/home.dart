import 'package:flutter/material.dart';

import 'add_students.dart';
import 'database.dart';
import 'model.dart';

final dbHelper = DatabaseHelper();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  bool status = false;
  String name = "";
  bool searchState = false;
  TextEditingController searchcontroller = TextEditingController();

  List<ModelPass> _userList = [];

  getAllUserPassword() async {
    var users = await dbHelper.queryAllRows();
    setState(() {
      _userList = <ModelPass>[];
    });

    users.forEach((user) {
      setState(() {
        var modelPass = ModelPass();
        modelPass.id = user['id'];
        modelPass.name = user['name'];
        modelPass.email = user['email'];
        modelPass.phone = user['phone'];
        modelPass.address = user['address'];
        modelPass.regno = user['regno'];
        modelPass.status = user['status'];
        modelPass.gender = user['gender'];
        _userList.add(modelPass);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getAllUserPassword();
    print(_userList);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: !searchState
            ? Text("Search Students")
            : TextField(
          controller: searchcontroller,
          cursorColor: Colors.white,
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Search here...",
            hintStyle: TextStyle(color: Colors.white),
            focusColor: Colors.teal,
          ),
          onChanged: (value) {
            setState(() {
              name = value;
            });
          },
        ),
        actions: [
          !searchState
              ? IconButton(
              onPressed: () {
                setState(() {
                  searchState = !searchState;
                });
              },
              icon: Icon(Icons.search))
              : IconButton(
              onPressed: () {
                setState(() {
                  searchState = !searchState;
                  searchcontroller.clear();
                  name = "";
                });
              },
              icon: Icon(Icons.cancel)),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: dbHelper.mydb().then((db) => dbHelper.queryAllRows()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Map<String, dynamic>>? row = snapshot.data;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(
                      label: Text('Reg#'),
                    ),
                    DataColumn(
                      label: Text('Name'),
                    ),
                    DataColumn(
                      label: Text('Email'),
                    ),
                    DataColumn(
                      label: Text('Phone'),
                    ),
                    DataColumn(
                      label: Text('Gender'),
                    ),
                  ],
                  rows: row!.map((item) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Text(item['reg']),
                        ),
                        DataCell(
                          Text(item['name']),
                        ),
                        DataCell(
                          Text(item['email']),
                        ),
                        DataCell(
                          Text(item['phone']),
                        ),
                        DataCell(
                          Text(item['gender']),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              );

              // return ListView.builder(
              //   itemCount: rows?.length,
              //   itemBuilder: (context, index) {
              //     Map<String, dynamic> list = rows![index];
              //     return Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Container(
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             color: Colors.pink.shade100),
              //         child: ExpansionTile(
              //           trailing: Icon(
              //             Icons.arrow_drop_down,
              //             color: Colors.white,
              //           ),
              //           backgroundColor: Colors.black54,
              //           title: Text(
              //             list['reg'],
              //             style: TextStyle(
              //                 color: Colors.white, fontWeight: FontWeight.bold),
              //           ),
              //           children: <Widget>[
              //             Padding(
              //               padding: const EdgeInsets.only(
              //                   top: 15, left: 15, right: 15),
              //               child: Row(
              //                 children: [
              //                   Text(
              //                     "Student Name",
              //                     style: TextStyle(color: Colors.white),
              //                   ),
              //                   Spacer(),
              //                   Text(
              //                     list['name'],
              //                     style: TextStyle(color: Colors.white),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(
              //                   top: 15, left: 15, right: 15),
              //               child: Row(
              //                 children: [
              //                   Text(
              //                     "Phone number",
              //                     style: TextStyle(color: Colors.white),
              //                   ),
              //                   Spacer(),
              //                   Text(
              //                     list['phone'],
              //                     style: TextStyle(color: Colors.white),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(
              //                   top: 15, left: 15, right: 15),
              //               child: Row(
              //                 children: [
              //                   Text(
              //                     "Email",
              //                     style: TextStyle(color: Colors.white),
              //                   ),
              //                   Spacer(),
              //                   Text(
              //                     list['email'],
              //                     style: TextStyle(color: Colors.white),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(
              //                   top: 15, left: 15, right: 15),
              //               child: Row(
              //                 children: [
              //                   Text(
              //                     "Gender",
              //                     style: TextStyle(color: Colors.white),
              //                   ),
              //                   Spacer(),
              //                   Text(
              //                     list['gender'],
              //                     style: TextStyle(color: Colors.white),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             SizedBox(
              //               height: 10,
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   InkWell(
              //                     onTap: () async {
              //                       final id = await dbHelper.queryRowCount();
              //
              //                       await showDialog(
              //                           context: context,
              //                           builder: (BuildContext context) {
              //                             return AlertDialog(
              //                               title: Text('Are you sure?'),
              //                               actions: [
              //                                 TextButton(
              //                                   onPressed: () async {
              //                                     final rowsDeleted =
              //                                         await dbHelper.delete(id);
              //                                     setState(() {
              //                                       Home();
              //                                     });
              //                                     Navigator.pop(context);
              //                                   },
              //                                   child: Text(
              //                                     'Yes',
              //                                     style: TextStyle(
              //                                         color: Colors.pink),
              //                                   ),
              //                                 ),
              //                                 TextButton(
              //                                   onPressed: () {
              //                                     Navigator.of(context).pop();
              //                                   },
              //                                   child: Text(
              //                                     'No',
              //                                     style: TextStyle(
              //                                         color: Colors.teal),
              //                                   ),
              //                                 ),
              //                               ],
              //                             );
              //                           });
              //                     },
              //                     child: Icon(
              //                       Icons.delete,
              //                       color: Colors.red,
              //                       size: 25,
              //                     ),
              //                   ),
              //                   IconButton(
              //                     onPressed: () async {
              //                       TextEditingController regno =
              //                           TextEditingController(
              //                               text: list['reg']);
              //                       TextEditingController name =
              //                           TextEditingController(
              //                               text: list['name']);
              //
              //                       TextEditingController email =
              //                           TextEditingController(
              //                               text: list['email']);
              //                       TextEditingController phone =
              //                           TextEditingController(
              //                               text: list['phone']);
              //                       await showDialog(
              //                         context: context,
              //                         builder: (BuildContext context) {
              //                           return AlertDialog(
              //                             title: Center(
              //                                 child: Text('Update Member')),
              //                             content: Column(
              //                               mainAxisSize: MainAxisSize.min,
              //                               children: [
              //                                 TextField(
              //                                   controller: regno,
              //                                   decoration: InputDecoration(
              //                                       prefixText: "RegNo: "),
              //                                 ),
              //                                 TextField(
              //                                   controller: name,
              //                                   decoration: InputDecoration(
              //                                       prefixText: "Name: "),
              //                                 ),
              //                                 TextField(
              //                                   controller: email,
              //                                   decoration: InputDecoration(
              //                                       prefixText: "Email: "),
              //                                 ),
              //                                 TextField(
              //                                   controller: phone,
              //                                   decoration: InputDecoration(
              //                                       prefixText:
              //                                           "Phone Number : "),
              //                                 ),
              //                               ],
              //                             ),
              //                             actions: [
              //                               TextButton(
              //                                 onPressed: () async {
              //                                   if (regno.text.isNotEmpty &&
              //                                       name.text.isNotEmpty &&
              //                                       email.text.isNotEmpty &&
              //                                       phone.text.isNotEmpty) {
              //                                     Map<String, dynamic> row = {
              //                                       DatabaseHelper.columnId:
              //                                           list['_id'],
              //                                       DatabaseHelper.columnName:
              //                                           name.text,
              //                                       DatabaseHelper.columnReg:
              //                                           regno.text,
              //                                       DatabaseHelper.columnEmail:
              //                                           email.text,
              //                                       DatabaseHelper.columnGender:
              //                                           list['gender'],
              //                                       DatabaseHelper.columnPhone:
              //                                           phone.text,
              //                                       DatabaseHelper.columnStatus:
              //                                           list['status'],
              //                                     };
              //                                     final rowsAffected =
              //                                         await dbHelper
              //                                             .update(row);
              //                                     setState(() {
              //                                       Home();
              //                                     });
              //                                     Navigator.of(context).pop();
              //                                   }
              //                                 },
              //                                 child: Text(
              //                                   'Update',
              //                                   style: TextStyle(
              //                                       color: Colors.pink),
              //                                 ),
              //                               ),
              //                               TextButton(
              //                                 onPressed: () {
              //                                   Navigator.of(context).pop();
              //                                 },
              //                                 child: Text(
              //                                   'Cancel',
              //                                   style: TextStyle(
              //                                       color: Colors.teal),
              //                                 ),
              //                               ),
              //                             ],
              //                           );
              //                         },
              //                       );
              //                     },
              //                     icon: Icon(
              //                       Icons.edit,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                   InkWell(
              //                     onTap: list['status'] == 1
              //                         ? () async {
              //                             Map<String, dynamic> row = {
              //                               DatabaseHelper.columnId:
              //                                   list['_id'],
              //                               DatabaseHelper.columnName:
              //                                   list['name'],
              //                               DatabaseHelper.columnReg:
              //                                   list['reg'],
              //                               DatabaseHelper.columnEmail:
              //                                   list['email'],
              //                               DatabaseHelper.columnGender:
              //                                   list['gender'],
              //                               DatabaseHelper.columnPhone:
              //                                   list['phone'],
              //                               DatabaseHelper.columnStatus: 0,
              //                             };
              //                             final rowsAffected =
              //                                 await dbHelper.update(row);
              //                             print(rowsAffected);
              //                             setState(() {
              //                               Home();
              //                             });
              //                           }
              //                         : () {},
              //                     child: Container(
              //                       height: 60,
              //                       width: 60,
              //                       decoration: BoxDecoration(
              //                           color: list['status'] == 1
              //                               ? Colors.red
              //                               : Colors.green,
              //                           borderRadius:
              //                               BorderRadius.circular(10)),
              //                       child: Center(
              //                         child: Text(
              //                           list['status'] == 1 ? "Unpaid" : "Paid",
              //                           style: TextStyle(color: Colors.white),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     );
              //     return Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child: Container(
              //         height: 190,
              //         width: MediaQuery.of(context).size.width,
              //         decoration: BoxDecoration(
              //             color: Colors.black,
              //             borderRadius: BorderRadius.circular(30)),
              //         child: Row(
              //           children: [
              //             Flexible(
              //               flex: 5,
              //               child: Column(
              //                 children: [
              //                   Padding(
              //                     padding: const EdgeInsets.only(
              //                         top: 15, left: 15, right: 15),
              //                     child: Row(
              //                       children: [
              //                         Text(
              //                           "Registration Number",
              //                           style: TextStyle(color: Colors.white),
              //                         ),
              //                         Spacer(),
              //                         Text(
              //                           list['reg'],
              //                           style: TextStyle(color: Colors.white),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                   Padding(
              //                     padding: const EdgeInsets.only(
              //                         top: 15, left: 15, right: 15),
              //                     child: Row(
              //                       children: [
              //                         Text(
              //                           "Student Name",
              //                           style: TextStyle(color: Colors.white),
              //                         ),
              //                         Spacer(),
              //                         Text(
              //                           list['name'],
              //                           style: TextStyle(color: Colors.white),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                   Padding(
              //                     padding: const EdgeInsets.only(
              //                         top: 15, left: 15, right: 15),
              //                     child: Row(
              //                       children: [
              //                         Text(
              //                           "Phone number",
              //                           style: TextStyle(color: Colors.white),
              //                         ),
              //                         Spacer(),
              //                         Text(
              //                           list['phone'],
              //                           style: TextStyle(color: Colors.white),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                   Padding(
              //                     padding: const EdgeInsets.only(
              //                         top: 15, left: 15, right: 15),
              //                     child: Row(
              //                       children: [
              //                         Text(
              //                           "Email",
              //                           style: TextStyle(color: Colors.white),
              //                         ),
              //                         Spacer(),
              //                         Text(
              //                           list['email'],
              //                           style: TextStyle(color: Colors.white),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                   Padding(
              //                     padding: const EdgeInsets.only(
              //                         top: 15, left: 15, right: 15),
              //                     child: Row(
              //                       children: [
              //                         Text(
              //                           "Gender",
              //                           style: TextStyle(color: Colors.white),
              //                         ),
              //                         Spacer(),
              //                         Text(
              //                           list['gender'],
              //                           style: TextStyle(color: Colors.white),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Flexible(
              //               flex: 1,
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 children: [
              //                   InkWell(
              //                     onTap: () async {
              //                       final id = await dbHelper.queryRowCount();
              //
              //                       await showDialog(
              //                           context: context,
              //                           builder: (BuildContext context) {
              //                             return AlertDialog(
              //                               title: Text('Are you sure?'),
              //                               actions: [
              //                                 TextButton(
              //                                   onPressed: () async {
              //                                     final rowsDeleted =
              //                                         await dbHelper.delete(id);
              //                                     setState(() {
              //                                       Home();
              //                                     });
              //                                     Navigator.pop(context);
              //                                   },
              //                                   child: Text(
              //                                     'Yes',
              //                                     style: TextStyle(
              //                                         color: Colors.pink),
              //                                   ),
              //                                 ),
              //                                 TextButton(
              //                                   onPressed: () {
              //                                     Navigator.of(context).pop();
              //                                   },
              //                                   child: Text(
              //                                     'No',
              //                                     style: TextStyle(
              //                                         color: Colors.teal),
              //                                   ),
              //                                 ),
              //                               ],
              //                             );
              //                           });
              //                     },
              //                     child: Icon(
              //                       Icons.delete,
              //                       color: Colors.red,
              //                       size: 25,
              //                     ),
              //                   ),
              //                   IconButton(
              //                     onPressed: () async {
              //                       TextEditingController regno =
              //                           TextEditingController(
              //                               text: list['reg']);
              //                       TextEditingController name =
              //                           TextEditingController(
              //                               text: list['name']);
              //
              //                       TextEditingController email =
              //                           TextEditingController(
              //                               text: list['email']);
              //                       TextEditingController phone =
              //                           TextEditingController(
              //                               text: list['phone']);
              //                       await showDialog(
              //                         context: context,
              //                         builder: (BuildContext context) {
              //                           return AlertDialog(
              //                             title: Center(
              //                                 child: Text('Update Member')),
              //                             content: Column(
              //                               mainAxisSize: MainAxisSize.min,
              //                               children: [
              //                                 TextField(
              //                                   controller: regno,
              //                                   decoration: InputDecoration(
              //                                       prefixText: "RegNo: "),
              //                                 ),
              //                                 TextField(
              //                                   controller: name,
              //                                   decoration: InputDecoration(
              //                                       prefixText: "Name: "),
              //                                 ),
              //                                 TextField(
              //                                   controller: email,
              //                                   decoration: InputDecoration(
              //                                       prefixText: "Email: "),
              //                                 ),
              //                                 TextField(
              //                                   controller: phone,
              //                                   decoration: InputDecoration(
              //                                       prefixText:
              //                                           "Phone Number : "),
              //                                 ),
              //                               ],
              //                             ),
              //                             actions: [
              //                               TextButton(
              //                                 onPressed: () async {
              //                                   if (regno.text.isNotEmpty &&
              //                                       name.text.isNotEmpty &&
              //                                       email.text.isNotEmpty &&
              //                                       phone.text.isNotEmpty) {
              //                                     Map<String, dynamic> row = {
              //                                       DatabaseHelper.columnId:
              //                                           list['_id'],
              //                                       DatabaseHelper.columnName:
              //                                           name.text,
              //                                       DatabaseHelper.columnReg:
              //                                           regno.text,
              //                                       DatabaseHelper.columnEmail:
              //                                           email.text,
              //                                       DatabaseHelper.columnGender:
              //                                           list['gender'],
              //                                       DatabaseHelper.columnPhone:
              //                                           phone.text,
              //                                       DatabaseHelper.columnStatus:
              //                                           list['status'],
              //                                     };
              //                                     final rowsAffected =
              //                                         await dbHelper
              //                                             .update(row);
              //                                     setState(() {
              //                                       Home();
              //                                     });
              //                                     Navigator.of(context).pop();
              //                                   }
              //                                 },
              //                                 child: Text(
              //                                   'Update',
              //                                   style: TextStyle(
              //                                       color: Colors.pink),
              //                                 ),
              //                               ),
              //                               TextButton(
              //                                 onPressed: () {
              //                                   Navigator.of(context).pop();
              //                                 },
              //                                 child: Text(
              //                                   'Cancel',
              //                                   style: TextStyle(
              //                                       color: Colors.teal),
              //                                 ),
              //                               ),
              //                             ],
              //                           );
              //                         },
              //                       );
              //                     },
              //                     icon: Icon(
              //                       Icons.edit,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                   InkWell(
              //                     onTap: list['status'] == 1
              //                         ? () async {
              //                             Map<String, dynamic> row = {
              //                               DatabaseHelper.columnId:
              //                                   list['_id'],
              //                               DatabaseHelper.columnName:
              //                                   list['name'],
              //                               DatabaseHelper.columnReg:
              //                                   list['reg'],
              //                               DatabaseHelper.columnEmail:
              //                                   list['email'],
              //                               DatabaseHelper.columnGender:
              //                                   list['gender'],
              //                               DatabaseHelper.columnPhone:
              //                                   list['phone'],
              //                               DatabaseHelper.columnStatus: 0,
              //                             };
              //                             final rowsAffected =
              //                                 await dbHelper.update(row);
              //                             print(rowsAffected);
              //                             setState(() {
              //                               Home();
              //                             });
              //                           }
              //                         : () {},
              //                     child: Container(
              //                       height: 60,
              //                       width: 60,
              //                       decoration: BoxDecoration(
              //                           color: list['status'] == 1
              //                               ? Colors.red
              //                               : Colors.green,
              //                           borderRadius:
              //                               BorderRadius.circular(10)),
              //                       child: Center(
              //                         child: Text(
              //                           list['status'] == 1 ? "Unpaid" : "Paid",
              //                           style: TextStyle(color: Colors.white),
              //                         ),
              //                       ),
              //                     ),
              //                   )
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStudents()),
          );
        },
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: Text(
              "+",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
