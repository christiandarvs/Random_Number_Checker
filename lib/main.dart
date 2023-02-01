import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

int leftNum = 1;
int rightNum = 1;
bool isMatched = false;
bool isPressed = false;

void randomNum() {
  leftNum = Random().nextInt(20) + 1;
  rightNum = Random().nextInt(20) + 1;
  leftNum == rightNum ? isMatched = true : isMatched = false;
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blueGrey,
                      ),
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text(
                        '$leftNum',
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blueGrey,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '$rightNum',
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                  onPressed: (() {
                    setState(() {
                      randomNum();
                      isPressed = true;
                    });
                  }),
                  child: const Text('Generate Random Number')),
              const SizedBox(
                height: 40,
              ),
              isPressed
                  ? isMatched
                      ? const Text(
                          'Similar',
                          style: TextStyle(fontSize: 20),
                        )
                      : const Text(
                          'Different',
                          style: TextStyle(fontSize: 20),
                        )
                  : const Text('')
            ],
          ),
        ),
      ),
    );
  }
}
