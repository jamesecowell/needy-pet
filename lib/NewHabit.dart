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

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'New Habit',
            style: TextStyle(
              fontFamily: 'PressStart2P',
              color: Colors.black,
              fontSize: 25.0,
            ),
          ),
          Text(
            'Please enter a habit to continue. You can add more later.',
            style: TextStyle(
              fontFamily: 'PressStart2P',
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'enter habit...',
              fillColor: Colors.grey,
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: FlatButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
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