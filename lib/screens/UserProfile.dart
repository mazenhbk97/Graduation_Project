import 'package:flutter/material.dart';
import 'package:re7al/Models/Places.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  color: Colors.blueGrey,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context, 'HomeScreen');
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            title: Text(
              'Account Settings',
              style: TextStyle(color: Colors.blueGrey),
            ),
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    height: 160,
                    width: 170,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[500].withOpacity(0.8),
                            ),
                            height: 130,
                            width: 130,
                            child: Icon(Icons.perm_identity,
                                color: Colors.white, size: 90),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      TextInputField(
                        icon: Icons.person_rounded,
                        hint: 'User',
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next,
                      ),
                      TextInputField(
                        icon: Icons.person_rounded,
                        hint: 'User',
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next,
                      ),
                      TextInputField(
                        icon: Icons.mail_outline,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      PasswordInput(
                        icon: Icons.lock,
                        hint: 'Password',
                        inputAction: TextInputAction.next,
                      ),
                      PasswordInput(
                        icon: Icons.lock,
                        hint: 'Confirm Password',
                        inputAction: TextInputAction.done,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RoundedButton(buttonName: 'Register'),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            //style: kBodyText,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'UserProfile');
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      // Column(
                      //   children: [
                      //     TextInputField(
                      //       icon: Icons.person_rounded,
                      //       hint: 'User',
                      //       inputType: TextInputType.name,
                      //       inputAction: TextInputAction.next,
                      //     ),
                      //     TextInputField(
                      //       icon: Icons.mail_outline,
                      //       hint: 'Email',
                      //       inputType: TextInputType.emailAddress,
                      //       inputAction: TextInputAction.next,
                      //     ),
                      //     PasswordInput(
                      //       icon: Icons.lock,
                      //       hint: 'Password',
                      //       inputAction: TextInputAction.next,
                      //     ),
                      //     PasswordInput(
                      //       icon: Icons.lock,
                      //       hint: 'Confirm Password',
                      //       inputAction: TextInputAction.done,
                      //     ),
                      //     SizedBox(
                      //       height: 25,
                      //     ),
                      //     RoundedButton(buttonName: 'Register'),
                      //     SizedBox(
                      //       height: 30,
                      //     ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text(
                      //           'Already have an account?',
                      //           //style: kBodyText,
                      //         ),
                      //         GestureDetector(
                      //           onTap: () {
                      //             Navigator.pushNamed(context, 'UserProfile');
                      //           },
                      //           // child: Text(
                      //           //   'Login',
                      //           //   style: kBodyText.copyWith(
                      //           //       color: kBlue, fontWeight: FontWeight.bold),
                      //           // ),
                      //         ),
                      //       ],
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
