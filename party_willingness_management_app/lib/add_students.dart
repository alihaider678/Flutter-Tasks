// import 'dart:io';
//
// import 'package:excel/excel.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
//
// import 'database.dart';
// import 'home.dart';
//
// class AddStudents extends StatefulWidget {
//   @override
//   _AddStudentsState createState() => _AddStudentsState();
// }
//
// class _AddStudentsState extends State<AddStudents> {
//   String? _filePath;
//   String? _fileName;
//   bool isLoad = false;
//
//   void _pickFile() async {
//     final result = await FilePicker.platform.pickFiles(allowMultiple: true);
//     print(result);
//
//     if (result == null) return;
//
//     // we get the file from result object
//     final file = result.files.first;
//     setState(() {
//       _fileName = file.name;
//     });
//     var bytes = File(file.path ?? "").readAsBytesSync();
//     var excel = Excel.decodeBytes(bytes);
//     final row = excel.tables[excel.tables.keys.first]!.rows
//         .map((e) => e.map((e) => e!.value).toList())
//         .toList();
//
//     row.forEach((e) async {
//       int index = row.indexOf(e);
//       print(row[index][0]);
//       Map<String, dynamic> rw = {
//         DatabaseHelper.columnName: row[index][1].toString(),
//         DatabaseHelper.columnReg: row[index][2].toString(),
//         DatabaseHelper.columnEmail: row[index][3].toString(),
//         DatabaseHelper.columnGender: row[index][4].toString(),
//         DatabaseHelper.columnPhone: row[index][5].toString(),
//         DatabaseHelper.columnStatus: 1,
//       };
//       final id = await dbHelper.insert(rw);
//       debugPrint('inserted row id: $id');
//
//       if (id != null) {
//         const snackBar = SnackBar(
//           content: Text('Save Data Successfully '),
//         );
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       } else {
//         const snackBar = SnackBar(
//           content: Text('Something Went wrong'),
//         );
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: BackButton(
//           onPressed: () {
//             Navigator.pushReplacement(
//                 context, MaterialPageRoute(builder: (context) => Home()));
//           },
//         ),
//         backgroundColor: Colors.green,
//         title: Text("Add Students"),
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
//             child: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   color: Colors.black, borderRadius: BorderRadius.circular(30)),
//               child: TextButton(
//                 onPressed: () {
//                   _pickFile();
//                 },
//                 child: Text(
//                   "Import Excel File and Upload",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ),
//             ),
//           ),
//           Text(_fileName == null ? "" : _fileName.toString()),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:party/home.dart';

import 'database.dart';

final dbHelper = DatabaseHelper();

class AddStudents extends StatefulWidget {
  const AddStudents({Key? key}) : super(key: key);

  @override
  _AddStudentsState createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  TextEditingController regCon = new TextEditingController();
  TextEditingController nameCon = new TextEditingController();
  TextEditingController emailCon = new TextEditingController();
  TextEditingController addressCon = new TextEditingController();
  TextEditingController phoneCon = new TextEditingController();

  bool isloading = false;
  int a = 1;

  bool check = false;
  bool _isMale = false;
  bool _isFemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        centerTitle: true,
        title: Text("Add Student"),
        backgroundColor: Colors.black,
      ),
      body: isloading
          ? CircularProgressIndicator()
          : Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: [
                  TextField(
                    controller: regCon,
                    decoration: InputDecoration(
                      label: Text(
                        "Enter Registration Number",
                        style: TextStyle(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: "SP12-BCS-000",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: nameCon,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: Text(
                        "Enter Student name",
                        style: TextStyle(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: "abc",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: phoneCon,
                    decoration: InputDecoration(
                      label: Text(
                        "Enter Phone Number",
                        style: TextStyle(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: "03012323237",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: emailCon,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: Text(
                        "Enter Email",
                        style: TextStyle(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: "example@gmail.com",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Select your gender:')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _isMale,
                        onChanged: (value) {
                          setState(() {
                            _isMale = value!;
                            // _isFemale = false;
                          });
                        },
                      ),
                      Text('Male'),
                      Checkbox(
                        value: _isFemale,
                        onChanged: (value) {
                          setState(() {
                            _isFemale = value!;
                            // _isMale = false;
                          });
                        },
                      ),
                      Text('Female'),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          Map<String, dynamic> row = {
                            DatabaseHelper.columnName: nameCon.text,
                            DatabaseHelper.columnReg: regCon.text,
                            DatabaseHelper.columnEmail: nameCon.text,
                            DatabaseHelper.columnGender:
                                _isMale == false ? "Male" : "Female",
                            DatabaseHelper.columnPhone: phoneCon.text,
                            DatabaseHelper.columnStatus: 1,
                          };
                          final id = await dbHelper.insert(row);
                          debugPrint('inserted row id: $id');
                        },
                        child: Text("Add Member"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          padding: EdgeInsets.all(15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
