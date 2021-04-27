import 'package:flutter/material.dart';
import 'package:re7al/Models/Places.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // BackgroundImage(
        //   image: 'assets/images/images/login.jpg',
        // ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: ExactAssetImage("images/login.jpg"),
            //       fit: BoxFit.cover),
            // ),
            child: Column(
              children: [
                // Padding(
                //   padding: EdgeInsets.only(top: 60.0, bottom: 40.0),
                //   child: CircleAvatar(
                //     radius: 90.0,
                //     backgroundImage: AssetImage('images/Re7al.jfif'),
                //   ),
                // ),

                Flexible(
                  child: Center(
                    child: CircleAvatar(
                      radius: 90.0,
                      backgroundImage: AssetImage('images/Re7al.jfif'),
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // TextInputField(
                    //   icon: FontAwesomeIcons.envelope,
                    //   hint: 'Email',
                    //   inputType: TextInputType.emailAddress,
                    //   inputAction: TextInputAction.next,
                    // ),
                    // PasswordInput(
                    //   icon: FontAwesomeIcons.lock,
                    //   hint: 'Password',
                    //   inputAction: TextInputAction.done,
                    // ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, 'ForgotPassword'),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    // RoundedButton(
                    //   buttonName: 'Login',
                    // ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'CreateNewAccount'),
                  child: Container(
                    child: Text(
                      'Create New Account',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.white))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
