import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:re7al/Widgets/Login_TFF.dart';
import 'package:re7al/providers/auth_provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool check = false;
  String mail;
  String password;

  void setMail(String mailField) {
    setState(() {
      mail = mailField;
    });
  }

  void setPassword(String passwordField) {
    setState(() {
      password = passwordField;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              color: user_auth,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, 'HomeScreen');
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("images/bgcolor.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Image.asset(
                  'images/re7al_logo.png',
                  height: 100,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: user_auth),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Login_TFF(
                    saveName: setMail,
                    savePassword: setPassword,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Checkbox(
                            value: this.check,
                            onChanged: (bool value) {
                              setState(() {
                                this.check = value;
                              });
                            },
                          ),
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(color: user_auth),
                        ),
                      ],
                    ), //Checkbox

                    GestureDetector(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, 'ForgotPass');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: user_auth,
                  ),
                  child: FlatButton(
                    onPressed: () async {
                      await Provider.of<AuthProvider>(context, listen: false)
                          .signIn(mail, password);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'Or',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () =>
                          Provider.of<AuthProvider>(context, listen: false)
                              .googleSign(),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.orangeAccent,
                        child: Text(
                          'G',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blueAccent,
                      child: Text(
                        'F',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text('Do not have an account yet ?')),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: GestureDetector(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'SignUp');
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
