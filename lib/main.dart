import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var backGround = Colors.lightBlueAccent;
  var appBarColor = Colors.lightBlueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: appBarColor,

      ),
      // May be i have to remove the const.
      body: Container(
        color: backGround,
        child: Center(
          child: Container(
            width: 300,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Your BMI', style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700
                ),),

                SizedBox(height: 21,),

                // Weight Text Field
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your Weight(in Kgs)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                // Height Text Filed (Feet)
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your Height (in Feet)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11,),

                // Height Text Filed (Inch)
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your Height (in Inch)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 21,),

                // Raised Button
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {

                    var iWt = double.parse(wt);
                    var ift = double.parse(ft);
                    var iInch = double.parse(inch);
                    var tInch = iInch;
                    if(iInch < 12) {
                      tInch = (ift*12) + iInch;
                    }
                    var heightInCm = tInch * 2.54;
                    var heightInM = heightInCm / 100;

                    var bmi = iWt/(heightInM*heightInM);
                    var message = "";

                    if(bmi > 25) {
                      message = "You're OverWeight!!";
                      backGround = Colors.deepOrangeAccent;
                    } else if(bmi < 18) {
                      message = "You're UnderWeight!!";
                      backGround = Colors.orangeAccent;
                    } else {
                      message = "You're Healthy!!";
                      backGround = Colors.greenAccent;
                    }
                    appBarColor = backGround;

                    setState(() {
                      result = "$message \nYour BMI: ${bmi.toStringAsFixed(2)}";
                    });

                  } else {
                    setState(() {
                      result = "Please fill all the required fields!!";
                    });
                  }


                },
                  child: Text('Calculate'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.tealAccent)
                  ),
                ),

                SizedBox(height: 21),

                Text(
                  result,
                  style: TextStyle(fontSize: 21),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      )

    );
  }
}
