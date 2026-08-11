import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder()),
          child: Text('Calculate'),
        ),
      ),
    );
  }
}
