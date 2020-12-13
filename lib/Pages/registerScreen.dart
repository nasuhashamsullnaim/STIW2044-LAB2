import 'package:deafzone2/Pages/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new RegisterScreen());

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
//  _formKey and _autoValidate
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // bool _autoValidate = false;
  bool agree = false;

  final TextEditingController _fnamecontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _statecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  String fname = "";
  String phone = "";
  String email = "";
  String state = "";
  String password = "";
  bool _rememberMe = false;
  bool passwordVisible = false;

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Confirmation"),
          content: new Text("Are you sure to register?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: _onCancel,
            ),
            new FlatButton(
              child: new Text("Continue"),
              onPressed: _onRegister,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: Text('D E A F Z O N E'),
          backgroundColor: Colors.teal[800],
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(10.0),
            child: new Form(
              key: _formKey,
              // ignore: deprecated_member_use
              autovalidate: true,
              child: formUI(),
            ),
          ),
        ),
      ),
    );
  }

// Here is our Form UI
  Widget formUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          controller: _fnamecontroller,
          keyboardType: TextInputType.name,
          decoration:
              InputDecoration(labelText: 'Full Name', icon: Icon(Icons.place)),
          validator: validateName,
          onSaved: (String val) {
            fname = val;
          },
        ),
        new TextFormField(
          controller: _phonecontroller,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              labelText: 'Phone Number', icon: Icon(Icons.phone)),
          validator: validatePhone,
          onSaved: (String val) {
            phone = val;
          },
        ),
        new TextFormField(
          controller: _statecontroller,
          keyboardType: TextInputType.text,
          decoration:
              InputDecoration(labelText: 'State', icon: Icon(Icons.place)),
          validator: validateState,
          onSaved: (String val) {
            state = val;
          },
        ),
        new TextFormField(
          controller: _emailcontroller,
          keyboardType: TextInputType.emailAddress,
          decoration:
              InputDecoration(labelText: 'Email', icon: Icon(Icons.email)),
          validator: validateEmail,
          onSaved: (String val) {
            email = val;
          },
        ),
        new TextFormField(
          controller: _passwordcontroller,
          keyboardType: TextInputType.visiblePassword,
          decoration:
              InputDecoration(labelText: 'Password', icon: Icon(Icons.lock)),
          obscureText: true,
          validator: validatePassword,
          onSaved: (String val) {
            password = val;
          },
        ),
        Row(
          children: [
            Material(
              child: Checkbox(
                value: agree,
                onChanged: (value) {
                  setState(() {
                    agree = value;
                  });
                },
              ),
            ),
            Text(
              'I have read & accept terms and conditions',
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        Row(
          children: <Widget>[
            Checkbox(
              value: _rememberMe,
              onChanged: (bool value) {
                _onChange(value);
              },
            ),
            Text('Remember Me', style: TextStyle(fontSize: 16))
          ],
        ),
        new SizedBox(
          height: 1,
        ),
        MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            minWidth: 200,
            height: 30,
            child: Text('SIGN UP'),
            color: Colors.teal[700],
            textColor: Colors.white,
            elevation: 8,
            onPressed: agree ? _showDialog : null),
        GestureDetector(
            onTap: _onLogin,
            child: Text('Sign In Existing Account',
                style: TextStyle(fontSize: 15, color: Colors.black))),
      ],
    );
  }

  String validateState(String value) {
    if (value.length < 3)
      return 'State must be aplhabets only';
    else
      return null;
  }

  String validatePhone(String value) {
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.length < 6)
      return 'Password length must be 6 with combination of alphabets & numbers';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email Format';
    else
      return null;
  }

  void savepref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    email = _emailcontroller.text;
    password = _passwordcontroller.text;
    await pref.setString('email', email);
    await pref.setString('password', password);
    await pref.setBool('rememberme', true);
  }

  void _onChange(bool value) {
    setState(() {
      _rememberMe = value;
    });
  }

  void _onRegister() async {
    fname = _fnamecontroller.text;
    phone = _phonecontroller.text;
    email = _emailcontroller.text;
    state = _statecontroller.text;
    password = _passwordcontroller.text;

    ProgressDialog pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);
    pr.style(message: "Registration...");
    await pr.show();
    http.post("http://itsmelele.com/DeafZone/php/register.php", body: {
      "fname": fname,
      "phone": phone,
      "email": email,
      "state": state,
      "password": password,
    }).then((res) {
      print(res.body);
      if (res.body == "success") {
        Toast.show(
          "Registration successful! An email has been sent to .$email. Please check your email/SPAM folder for OTP verification",
          context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.TOP,
        );
        if (_rememberMe) {
          savepref();
        }
        _onLogin();
      } else {
        Toast.show(
          "Registration failed",
          context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.TOP,
        );
      }
    }).catchError((err) {
      print(err);
    });
    await pr.hide();
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be aplhabets only';
    else
      return null;
  }

  void _onLogin() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  void _onCancel() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }
}
