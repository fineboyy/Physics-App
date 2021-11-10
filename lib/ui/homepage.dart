import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _principalController =
      new TextEditingController();
  final TextEditingController _rateController = new TextEditingController();
  final TextEditingController _timeController = new TextEditingController();
  double interest = 0.0;

  void calculateInterest() {
    double principal = double.parse(_principalController.text);
    double rateDecimal = double.parse(_rateController.text);
    double time = double.parse(_timeController.text);

    double rate = rateDecimal / 100;

    setState(() {
      interest = principal * rate * time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Magic Calculator"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              height: 250.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Simple Interest",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    "GH₵$interest",
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
                    controller: _principalController,
                    decoration: new InputDecoration(
                        labelText: "Principal", hintText: "e.g. 2500"),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(Icons.watch),
                  title: TextField(
                    controller: _rateController,
                    decoration: new InputDecoration(
                        labelText: "Rate(%)", hintText: "e.g. 15"),
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
                        labelText: "Time in years", hintText: "e.g. 2"),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: calculateInterest,
        label: Text("Do the Magic!"),
        icon: Icon(Icons.navigation),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
