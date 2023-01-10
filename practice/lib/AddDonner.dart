import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'DonnerList.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';

import 'colors.dart';
import 'db_manager.dart';

class AddDonner extends StatefulWidget {
  const AddDonner({Key? key}) : super(key: key);

  @override
  _AddDonnerState createState() => _AddDonnerState();
}

class _AddDonnerState extends State<AddDonner> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _BG = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  File? imageFile;
  final ImagePicker _picker = ImagePicker();
  String currentCategory = "";
  var imageEncoded;
  List<String> allCategoryData = [];
  final dbHelper = DatabaseHelper.instance;
  late Future<Uint8List> imageBytes;
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.red,
    exportBackgroundColor: Colors.blue,
  );

// INITIALIZE. RESULT IS A WIDGET, SO IT CAN BE DIRECTLY USED IN BUILD METHOD

  @override
  void initState() {
    super.initState();
    _query();
    var _signatureCanvas = Signature(
      controller: _controller,
      width: 300,
      height: 300,
      backgroundColor: Colors.lightBlueAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: MyColors.primaryColor,
          centerTitle: true,
          title: Text("Donor"),
        ),
        body: ListView(
          children: [
            SizedBox(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          final XFile? pickedFile = await _picker.pickImage(
                              source: ImageSource.gallery);

                          if (pickedFile != null) {
                            imageBytes = pickedFile.readAsBytes();
                            setState(() {
                              imageFile = File(pickedFile.path);
                            });
                          }
                        },
                        child: imageFile == null
                            ? CircleAvatar(
                                backgroundColor: MyColors.primaryColor,
                                minRadius: 50,
                                child: Icon(
                                  Icons.image,
                                  color: Colors.red,
                                ),
                              )
                            : CircleAvatar(
                                backgroundImage: Image.file(
                                  imageFile!,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ).image,
                                minRadius: 100,
                              ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.primaryColor, width: 1.0),
                          ),
                          hintText: 'fname',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        ),
                        controller: _firstName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter First Name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.primaryColor, width: 1.0),
                          ),
                          hintText: 'lname',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        ),
                        controller: _lastName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Last First Name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.primaryColor, width: 1.0),
                          ),
                          hintText: 'mobile no.',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        ),
                        controller: _mobileNumber,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Mobile Number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.primaryColor, width: 1.0),
                          ),
                          hintText: 'A+',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        ),
                        controller: _BG,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Blood group';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButtonTheme(
                        data: TextButtonThemeData(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                MyColors.primaryColor),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (formGlobalKey.currentState!.validate()) {
                              _insert();
                            }
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _insert() async {
    var base64image;
    if (imageFile?.exists() != null) {
      base64image = base64Encode(imageFile!.readAsBytesSync().toList());
    }

    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: _firstName.text,
      DatabaseHelper.columnLName: _lastName.text,
      DatabaseHelper.columnMobile: _mobileNumber.text,
      DatabaseHelper.columnEmail: _emailAddress.text,
      DatabaseHelper.columnBG: _BG.text,
      DatabaseHelper.columnCategory: currentCategory,
      DatabaseHelper.columnProfile: base64image,
    };
    print('insert stRT');
    currentCategory = "";

    final id = await dbHelper.insertDonner(row);
    if (kDebugMode) {
      print('inserted row id: $id');
    }
    _query();
    Navigator.push(context, MaterialPageRoute(builder: (_) => DonnerList()));
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    if (kDebugMode) {
      print('query all rows:');
    }
    for (var element in allRows) {
      allCategoryData.add(element["name"]);
    }
    setState(() {});
  }
}
