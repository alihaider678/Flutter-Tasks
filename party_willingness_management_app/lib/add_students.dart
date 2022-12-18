import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:party/tabbar.dart';

import 'database.dart';
import 'home.dart';

class AddStudents extends StatefulWidget {
  @override
  _AddStudentsState createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  String? _filePath;
  String? _fileName;
  bool isLoad = false;

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    print(result);

    if (result == null) return;

    // we get the file from result object
    final file = result.files.first;
    setState(() {
      _fileName = file.name;
    });
    var bytes = File(file.path ?? "").readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    final row = excel.tables[excel.tables.keys.first]!.rows
        .map((e) => e.map((e) => e!.value).toList())
        .toList();

    row.forEach((e) async {
      int index = row.indexOf(e);
      print(row[index][0]);
      Map<String, dynamic> rw = {
        DatabaseHelper.columnName: row[index][1].toString(),
        DatabaseHelper.columnReg: row[index][2].toString(),
        DatabaseHelper.columnEmail: row[index][3].toString(),
        DatabaseHelper.columnGender: row[index][6].toString(),
        DatabaseHelper.columnPhone: row[index][4].toString(),
        DatabaseHelper.columnStatus: 1,
      };
      final id = await dbHelper.insert(rw);
      debugPrint('inserted row id: $id');

      if (id != null) {
        const snackBar = SnackBar(
          content: Text('Save Data Successfully '),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        const snackBar = SnackBar(
          content: Text('Something Went wrong'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => TabBarScreen()));
          },
        ),
        backgroundColor: Colors.grey.shade800,
        title: Text("Add Students"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.pink.shade100, borderRadius: BorderRadius.circular(30)),
              child: TextButton(
                onPressed: () {
                  _pickFile();
                },
                child: Text(
                  "Import Excel File and Upload",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          Text(_fileName == null ? "" : _fileName.toString()),
        ],
      ),
    );
  }
}

