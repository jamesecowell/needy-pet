import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Welcome extends StatefulWidget {
  @override
  _Welcome createState() {
    return _Welcome();
  }
}

class _Welcome extends State<Welcome> {
  final dbRef = Firestore.instance.collection('new_habit');

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      new StreamBuilder(
          stream: Firestore.instance
              .collection('welcome')
              .document('jamesinfo')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return new Text("Loading",
                  style: TextStyle(
                      fontFamily: 'PressStart2P', color: Colors.cyan));
            }
            var userDocument = snapshot.data;
            final name = userDocument["name"];
            final pet = userDocument["pet"];
            final goal = userDocument["goal"];
            return new Text(
                'hi ${name}, it is time to get to work now on your goal of "${goal}" or ${pet} will die of starvation',
                style:
                    TextStyle(fontFamily: 'PressStart2P', color: Colors.cyan));
          }),
    ]);
  }
}
