import 'package:flutter/material.dart';
import 'package:needy_pet/Welcome.dart';
import 'package:needy_pet/MyHabits.dart';

void main() {
  return runApp(MaterialApp(
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
        body: Welcome()),
  ));
}
