import 'package:flutter/material.dart';
import 'package:test1/bmi_result.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  bool isMale = true;
  double height = 170;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121314),
      appBar: AppBar(
        backgroundColor: Color(0xff121314),
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: !isMale ? Colors.white24 : Colors.redAccent,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Icon(Icons.male, color: Colors.white, size: 100),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: isMale ? Colors.white24 : Colors.redAccent,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Icon(Icons.female, color: Colors.white, size: 100),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Card(
                color: Colors.white24,
                child: Column(
                  children: [
                    Text(
                      '${height.toInt()} cm',
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    Slider(
                      value: height,
                      min: 140,
                      max: 200,
                      onChanged: (newHeight) {
                        setState(() {
                          height = newHeight;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BmiResult(height: height),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder()),
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
