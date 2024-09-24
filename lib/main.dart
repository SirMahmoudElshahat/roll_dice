import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Random _random = Random();
  int numOfDice = 1;
  bool isLoading = false;

  void rollDice() {
    setState(() {
      numOfDice = _random.nextInt(6) + 1;
      isLoading = false; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading 
                ? CircularProgressIndicator() // مؤشر التحميل
                : Image.asset(
                    "assets/images/dice-$numOfDice.png",
                    width: 200,
                  ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                  onPressed: rollDice,
                  child: const Text(
                    "Roll Dice",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
