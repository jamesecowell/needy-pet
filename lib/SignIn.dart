import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInForm(),
      backgroundColor: Colors.purple[200],
    );
  }
}

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            'Hi there! Please sign in or create an account to continue.',
            style: TextStyle(
                fontFamily: 'PressStart2P',
                color: Colors.black,
                fontSize: 25.0),
          ),
          Form(
            key: _formKey,
            child: Column(children: <Widget>[
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: 'username',
                ),
                style: TextStyle(
                  fontFamily: 'PressStart2P',
                  color: Colors.black,
                  fontSize: 16.0,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: 'password',
                ),
                style: TextStyle(
                  fontFamily: 'PressStart2P',
                  color: Colors.black,
                  fontSize: 16.0,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
              FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print('valid sign in');
                  }
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    color: Colors.black,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
