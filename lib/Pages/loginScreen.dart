import 'package:deafzone2/Pages/homeScreen.dart';
import 'package:deafzone2/Pages/registerScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('D E A F Z O N E'),
        backgroundColor: Colors.teal[800],
      ),
      body: new Container(
          decoration: new BoxDecoration(color: Colors.lightGreen[200]),
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/DeafZoneLogo.png',
                scale: 1,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email', icon: Icon(Icons.email))),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Password', icon: Icon(Icons.lock)),
                obscureText: true,
              ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  minWidth: 200,
                  height: 30,
                  child: Text('SIGN IN'),
                  color: Colors.teal[700],
                  textColor: Colors.white,
                  elevation: 7,
                  onPressed: _onHomePage),
              GestureDetector(
                  onTap: _onRegister,
                  child: Text('Register New Account',
                      style: TextStyle(fontSize: 17, color: Colors.black))),
            ],
          ))),
    );
  }

  void _onHomePage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
  }

  void _onRegister() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => RegisterScreen()));
  }
}
