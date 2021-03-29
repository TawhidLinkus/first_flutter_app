import 'package:flutter/material.dart';

import 'BaseAlertDialog.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final formKey = new GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Registration"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(40.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _usernameController,
                  decoration: InputDecoration(
                labelText: 'Enter your username'
                    ),
                ),
                  TextFormField(
                      controller: _passwordController, obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Enter your password'
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextButton(
                      child: Text('Register Now'),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                        alignment: Alignment.center
                      ),
                      onPressed: () {
                        String username = _usernameController.text;
                        String password = _passwordController.text;
                        print('Pressed');
                        print('login attempt: $username with $password');
                        var baseDialog = BaseAlertDialog(
                            title: "Confirm Registration",
                            content: "I Agree that the information provided is correct",
                            yesOnPressed: () {},
                            noOnPressed: () { Navigator.of(context).pop();},
                            yes: "Agree",
                            no: "Cancel");
                        showDialog(context: context, builder: (BuildContext context) => baseDialog);
                      },

                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}