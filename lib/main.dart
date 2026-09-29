import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DicePage(),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  final List<String> diceNames = [
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
  ];

  int leftDiceNumber = 1;
  int rightDiceNumber = 4;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'images/${diceNames[leftDiceNumber - 1]}.png',
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      'images/${diceNames[rightDiceNumber - 1]}.png',
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: rollDice,
              child: const Text('Lắc xúc xắc'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}