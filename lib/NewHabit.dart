import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewHabit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCustomForm(),
      backgroundColor: Colors.purple[200],
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final newHabitController = TextEditingController();
  final dbRef = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'New Habit',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                color: Colors.black,
                fontSize: 25.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Please enter a habit to continue. You can add more later.',
              style: TextStyle(
                fontFamily: 'PressStart2P',
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: newHabitController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                filled: true,
                fillColor: Colors.grey,
                hintText: 'enter habit...',
              ),
              style: TextStyle(
                fontFamily: 'PressStart2P',
                color: Colors.black,
                fontSize: 16.0,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a habit';
                }
                return null;
              },
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  addNewHabit(newHabitController.text);
                  // dbRef.push().set({"habit": newHabitController}).then((_) {
                  //   Scaffold.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text('Habit Added!'),
                  //     ),
                  //   );
                  //   newHabitController.clear();
                  // }).catchError((onError) {
                  //   Scaffold.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text(onError),
                  //     ),
                  //   );
                  // });
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Submitting Habit...')));
                }
              },
              child: Text(
                'Next >',
                style: TextStyle(
                  fontFamily: 'PressStart2P',
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addNewHabit(habit) async {
    await dbRef.collection('new_habit').document().setData({'habit': habit});
    DocumentReference ref =
        await dbRef.collection('books').add({'habit': habit});
    print(ref.documentID);
  }
}
