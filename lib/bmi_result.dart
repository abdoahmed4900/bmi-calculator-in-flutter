import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  final int result;

  final int age;

  final String gender;

  final TextStyle style =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  const BmiResult({
    Key? key,
    required this.result,
    required this.age,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Age : $age',
              style: style,
            ),
            Text(
              'Gender : $gender',
              style: style,
            ),
            Text(
              'Bmi result : $result',
              style: style,
            )
          ],
        ),
      ),
    );
  }
}
