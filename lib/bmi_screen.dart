// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice/bmi_result.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  late double height;

  late bool isGenderMale;

  late int age;

  late int weight;

  late double result;

  @override
  void initState() {
    super.initState();
    height = 100;
    age = 20;
    weight = 40;
    isGenderMale = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isGenderMale = true;
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color:
                                  isGenderMale ? Colors.blue : Colors.grey[400],
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FaIcon(FontAwesomeIcons.mars, size: 90),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Male',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 20),
                              )
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isGenderMale = false;
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color:
                                  isGenderMale ? Colors.grey[400] : Colors.blue,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FaIcon(FontAwesomeIcons.mars, size: 90),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Female',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 20),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Text(
                    'Height',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  EasyRichText(
                    '${height.round()} CM',
                    defaultStyle:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    patternList: [
                      EasyRichTextPattern(
                          targetString: 'CM',
                          subScript: true,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                          matchWordBoundaries: false)
                    ],
                  ),
                  Slider(
                    min: 80,
                    max: 220,
                    onChanged: (val) {
                      setState(() {
                        height = val;
                      });
                    },
                    value: height,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Text(
                              'Age',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '$age',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    if (age != 1) {
                                      setState(() {
                                        age--;
                                      });
                                    }
                                  },
                                  heroTag: 'age-',
                                  mini: true,
                                  child: Icon(Icons.remove),
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  heroTag: 'age+',
                                  mini: true,
                                  child: Icon(Icons.add),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Text(
                              'Weight',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '$weight',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    if (weight != 1) {
                                      setState(() {
                                        weight--;
                                      });
                                    }
                                  },
                                  heroTag: 'weight-',
                                  mini: true,
                                  child: Icon(Icons.remove),
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  heroTag: 'weight+',
                                  mini: true,
                                  child: Icon(Icons.add),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  result = weight / pow(height / 100, 2);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BmiResult(
                            result: result.round(),
                            age: age,
                            gender: isGenderMale ? 'Male' : 'Female'),
                      ));
                },
                child: Text('Calculate')),
          )
        ],
      ),
    );
  }
}
