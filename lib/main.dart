import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiScreen(),
    );
  }
}

class BmiScreen extends StatefulWidget {
  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  String gender = "female";
  double height = 155;
  int age = 18;
  int weight = 48;

  double result = 0;
  bool showResultPage = false;

  @override
  Widget build(BuildContext context) {
    if (showResultPage == true) {
      return Scaffold(
        backgroundColor: Color(0xFF0A0C21),
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0C21),
          title: Text("BMI Result"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: 320,
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Color(0xFF1D1E33),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Gender: $gender", style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(height: 15),
                Text("Height: ${height.toInt()} cm", style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(height: 15),
                Text("Age: $age", style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(height: 15),
                Text("Weight: $weight Kg", style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("RESULT: ", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                    Text("${result.toInt()}", style: TextStyle(color: Color(0xFFEB1555), fontSize: 26, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 25),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEB1555),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: () {
                    setState(() {
                      showResultPage = false;
                    });
                  },
                  icon: Icon(Icons.refresh, color: Colors.white),
                  label: Text("Calculate Again", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFF0A0C21),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0C21),
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "male";
                      });
                    },
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                        color: gender == "male" ? Color(0xFFEB1555) : Color(0xFF1D1E33),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.male, size: 60, color: Colors.white),
                          Text("MALE", style: TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "female";
                      });
                    },
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                        color: gender == "female" ? Color(0xFFEB1555) : Color(0xFF1D1E33),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.female, size: 60, color: Colors.white),
                          Text("FEMALE", style: TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text("HEIGHT", style: TextStyle(color: Colors.grey, fontSize: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${height.toInt()}", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                      Text(" cm", style: TextStyle(color: Colors.grey, fontSize: 16)),
                    ],
                  ),
                  Slider(
                    value: height,
                    min: 100,
                    max: 220,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Colors.grey,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1E33),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Text("AGE", style: TextStyle(color: Colors.grey, fontSize: 16)),
                        Text("$age", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton.small(
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                            SizedBox(width: 10),
                            FloatingActionButton.small(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xFF1D1E33),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Text("WEIGHT", style: TextStyle(color: Colors.grey, fontSize: 16)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("$weight", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                            Text(" Kg", style: TextStyle(color: Colors.grey, fontSize: 14)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton.small(
                              onPressed: () {
                                setState(() {
                                  if (weight > 1) weight--;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                            SizedBox(width: 10),
                            FloatingActionButton.small(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFEB1555),
                ),
                onPressed: () {
                  double hInMeters = height / 100;
                  result = weight / (hInMeters * hInMeters);
                  setState(() {
                    showResultPage = true;
                  });
                },
                child: Text("Calculate", style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
