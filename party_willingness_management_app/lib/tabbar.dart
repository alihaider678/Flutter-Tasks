import 'package:flutter/material.dart';
import 'package:party/home.dart';
import 'package:party/more_screen.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<String> titleList = [
    "Home",
    "More",
  ];
  String? currentTitle;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    currentTitle = titleList[0];

    _tabController?.addListener(changeTitle);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void changeTitle() {
    setState(() {
      // get index of active tab & change current appbar title
      currentTitle = titleList[_tabController!.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentTitle ?? ""),
        backgroundColor: Colors.grey.shade800,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.more)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [Home(), MoreScreen()],
      ),
    );
  }
}
