import 'package:flutter/material.dart';
import './HabitChecker.dart';

void main() {
   runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Text(
            'KEEPER',
            style: TextStyle(
              fontFamily: 'PressStart2P',
              color: Colors.yellow,
            ),
          ),
          backgroundColor: Colors.purple,
        ),
        body: HabitChecker(),
      ),
    ),
  );
}
