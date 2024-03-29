import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userinterface/pages/coffee_tile.dart';

import 'coffee_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '',
        ),
      ]),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text("Hello Ali,",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              )),
        ),
        Text(
          'Excited to choose something new today?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Find your coffe...",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600))),
          ),
        ),
        SizedBox(height: 25),
        Container(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeType(
                coffeeType: 'Cappucino',
                isSelected: true,
              ),
              CoffeeType(
                coffeeType: 'Latte',
                isSelected: false,
              ),
              CoffeeType(
                coffeeType: 'Black',
                isSelected: false,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                coffeeImagePath: 'assets/images/dark.jpg',
                coffeeName: 'Cappucino',
                coffeePrice: '420',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/images/light.jpg',
                coffeeName: 'Latte',
                coffeePrice: '510',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/images/milk.jpg',
                coffeeName: 'Milk Coffe',
                coffeePrice: '460',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
