import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/api_file.dart' as util;
import 'package:http/http.dart' as http;
import 'dart:convert';

class Climate extends StatefulWidget {
  const Climate({Key? key}) : super(key: key);

  @override
  State<Climate> createState() => _ClimateState();
}

class _ClimateState extends State<Climate> {
  void showStuff() async {
    Map data = await getWeather(util.apiId, util.defaultCity);
    print(data.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClimateApp'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: () => showStuff(),
            icon: Icon(Icons.menu),
          )
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Image(
              image: AssetImage('images/umbrella.png'),
              height: 1200.0,
              width: 600.0,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
            child: Text(
              'Vehari',
              style: cityStyle(),
            ),
          ),
        ],
      ),
    );
  }

  Future<Map> getWeather(String apiId, String city) async {
    var util;
    String ? apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid='
        '${util.apiId}&units=imperial';
    http.Response response = await http.get(apiUrl);

    return json.decode(response.body);
  }
}

TextStyle cityStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic,
  );
}
