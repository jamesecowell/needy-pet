import 'package:flutter/material.dart';

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
}
