import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI APP',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var str = "";

  var bgcolor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI APP')),
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: Container(
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                        label: Text('Enter your weight in kg'),
                        prefixIcon: Icon(Icons.line_weight)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text('Enter your height in feet'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                        label: Text('Enter your height in inch'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iInch = int.parse(inch);

                          var tInch = (ift * 12) + iInch;

                          var tcm = tInch * (2.54);

                          var tm = tcm / 100;

                          var bmi = iwt / (tm * tm);

                          var msg = "";

                          if (bmi > 25) {
                            msg = "You're overweight!";
                            bgcolor = Colors.orange;
                          } else if (bmi < 18) {
                            msg = "You're underweight";
                            bgcolor = Colors.red;
                          } else {
                            msg = "You're healthy";
                            bgcolor = Colors.green;
                          }
                          setState(() {
                            str =
                                "$msg \n Your BMI is :${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            str = "Please fill all the required blanks!";
                          });
                        }
                      },
                      child: Text('Calculate')),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    str,
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
