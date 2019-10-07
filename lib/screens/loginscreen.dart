import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[emailField(), passwordField(), submitButton()],
          )),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Email Address', hintText: 'you@example.com'),
      validator: (String value) {
        if (!value.contains('@')) {
          print('Enter valid email!!');
        }
        return null;
      },
      onSaved: (String value){
        print(value);
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'Password', hintText: 'Password'),
      validator: (String value) {
        if (value.length < 4) {
          print('Too Small');
        }
        return null;
      },
      onSaved: (String value){
        print(value);
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
        color: Colors.deepPurple, child: Text('Submit'), onPressed: () {
          if(formKey.currentState.validate()){
            formKey.currentState.save();
          }
    });
  }
}
