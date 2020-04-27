import 'package:flutter/material.dart';

class GoalSetter extends StatefulWidget {
  @override
  _GoalSetterState createState() => _GoalSetterState();
}

class _GoalSetterState extends State<GoalSetter> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              'hi james, select the creature you will take care of',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                color: Colors.cyan,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
