import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _initialVelocityController =
      new TextEditingController();
  final TextEditingController _accelerationController =
      new TextEditingController();
  final TextEditingController _timeController = new TextEditingController();
  double finalVelocity = 0.0;

  void calculatefinalVelocity() {
    double initialVelocity = double.parse(_initialVelocityController.text);
    double aceeleration = double.parse(_accelerationController.text);
    double time = double.parse(_timeController.text);

    double rate = aceeleration / 100;

    setState(() {
      finalVelocity = initialVelocity * rate * time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Container(
            height: 150.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.purple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Final Velocity",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  "${finalVelocity.toStringAsFixed(2)} m/s",
                  style: TextStyle(
                      fontSize: 34.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Icon(Icons.price_change),
                title: TextField(
                  controller: _initialVelocityController,
                  decoration: new InputDecoration(
                      labelText: "Initial Velocity", hintText: "e.g. 25"),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Icon(Icons.watch),
                title: TextField(
                  controller: _accelerationController,
                  decoration: new InputDecoration(
                      labelText: "Acceleration", hintText: "e.g. 10"),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Icon(Icons.lock_clock),
                title: TextField(
                  controller: _timeController,
                  decoration: new InputDecoration(
                      labelText: "Time in seconds", hintText: "e.g. 27"),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: ListTile(
                title: FlatButton(
                  onPressed: calculatefinalVelocity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  color: Colors.purpleAccent,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
