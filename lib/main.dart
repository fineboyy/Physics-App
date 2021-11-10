import 'package:flutter/material.dart';
import 'package:simple_interest_app/first_screen.dart';
import 'package:simple_interest_app/second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Physics App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("HandyMan Physics App"),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.directions_car),
                  text: "Velocity Calculator",
                ),
                Tab(
                  icon: Icon(Icons.water),
                  text: "Pressure Calculator",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [FirstScreen(), SecondScreen()],
          ),
        ),
      ),
    );
  }
}
