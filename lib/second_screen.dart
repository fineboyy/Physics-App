import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final TextEditingController _forceController = new TextEditingController();
  final TextEditingController _areaController = new TextEditingController();
  double pressure = 0.0;

  void calculatePressure() {
    double force = double.parse(_forceController.text);
    double area = double.parse(_areaController.text);

    setState(() {
      pressure = force / area;
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
                  "Pressure = Force/Area",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  "${pressure.toStringAsFixed(2)} Pa",
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
                  controller: _forceController,
                  decoration: new InputDecoration(
                      labelText: "Force", hintText: "e.g. 2500"),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Icon(Icons.watch),
                title: TextField(
                  controller: _areaController,
                  decoration: new InputDecoration(
                      labelText: "Area", hintText: "e.g. 15"),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: ListTile(
                title: FlatButton(
                  onPressed: calculatePressure,
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
