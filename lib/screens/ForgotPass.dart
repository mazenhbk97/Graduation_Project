import 'package:flutter/material.dart';
import 'package:re7al/Widgets/Constants.dart';

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
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
        title: Text(
          'Forgot Password',
          style: TextStyle(color: user_auth),
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
            child: Padding(
              padding: const EdgeInsets.all(20),
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
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Reset',
                            style: TextStyle(
                              fontSize: 60,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 60,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            'Enter the email address',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'associated with your account.',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: user_auth,
                        ),
                        labelText: 'Email',
                        hintText: 'UserName@gmail.com'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Email is Required';
                      }

                      if (!RegExp(
                              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                          .hasMatch(value)) {
                        return 'Please enter a valid email Address';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: user_auth,
                    ),
                    child: FlatButton(
                      child: Text(
                        'Reset Password',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        //style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
