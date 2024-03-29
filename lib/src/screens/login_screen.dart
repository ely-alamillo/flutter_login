import 'package:flutter/material.dart';
import 'package:flutter_login/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              emailField(),
              passwordField(),
              SizedBox(height: 15.0),
              submitButton(),
            ],
          ),
        ));
  }

  Widget emailField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (String value) {
          email = value;
        },
        validator: validateEmail,
        decoration: InputDecoration(
          labelText: 'Enter Email',
          hintText: "john@me.com",
        ));
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      onSaved: (String value) {
        password = value;
      },
      validator: validatePassword,
      decoration: InputDecoration(
        labelText: 'Enter Password',
        hintText: 'Password',
      ),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text("Signup"),
      color: Colors.blue,
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('email: $email, password: $password');
          formKey.currentState.reset();
        }
      },
    );
  }
}
