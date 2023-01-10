import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'db_manager.dart';

class DonnerList extends StatefulWidget {
  const DonnerList({Key? key}) : super(key: key);

  @override
  _DonnerListState createState() => _DonnerListState();
}

class _DonnerListState extends State<DonnerList> {
  final dbHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> allCategoryData = [];

  @override
  bool status = false;
  String name = "";
  bool searchState = false;
  TextEditingController searchcontroller = TextEditingController();
  void initState() {
    super.initState();
    _query();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          backgroundColor: MyColors.primaryColor,
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

        body: Column(
          children: [
            Text(""),
            Expanded(
                child: ListView.builder(
              itemCount: allCategoryData.length,
              padding: EdgeInsets.zero,
              itemBuilder: (_, index) {
                var item = allCategoryData[index];
                Uint8List bytes = base64Decode(item['profile']);
                return Container(
                  color: MyColors.orangeTile,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            child: Image.memory(
                              bytes,
                              fit: BoxFit.cover,
                            ),
                            minRadius: 20,
                            maxRadius: 25,
                          ),
                          Text("${item['name']}"),
                          Text("${item['lname']}"),
                          Spacer(),
                          IconButton(
                            onPressed: null,
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              _delete(item['_id']);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                      const Divider(
                        color: MyColors.orangeDivider,
                        thickness: 1,
                      ),
                    ],
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRowsofDonner();
    print('query all rows:');
    allRows.forEach(print);
    allCategoryData = allRows;
    setState(() {});
  }

  void _delete(int id) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await dbHelper.deleteDonner(id);
    print('deleted $rowsDeleted row(s): row $id');
    _query();
  }
}
