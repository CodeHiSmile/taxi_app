import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                color: Colors.red,
                child: Text("ashdashdh"),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                color: Colors.green,
                child: Text("ashdashdh"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
