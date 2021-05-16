import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:re7al/Widgets/PickUpUserPP.dart';
import 'package:re7al/Widgets/UserProfile_TFF.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:re7al/screens/test.dart';

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
          backgroundColor: bk_color,
          appBar: AppBar(
            elevation: 0,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  color: user_auth,
                  icon: Icon(
                    Icons.arrow_back,
                    color: user_auth,
                  ),
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
              style: TextStyle(color: user_auth),
            ),
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    PickUpUserPP(),
                    Container(
                      margin: EdgeInsets.only(
                        top: 40,
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            UserProfile_TFF(
                              TFprefixicon: Icon(
                                Icons.person_rounded,
                                color: user_auth,
                              ),
                              TFlabeltext: 'Name',
                              TFinitialvalue: 'My Name',
                              isvisible: false,
                            ),
                            UserProfile_TFF(
                              TFprefixicon: Icon(
                                Icons.mail,
                                color: user_auth,
                              ),
                              TFlabeltext: 'E-mail',
                              TFinitialvalue: 'My_Name@gmail.com',
                              isvisible: false,
                            ),
                            UserProfile_TFF(
                              TFprefixicon: Icon(
                                Icons.phone,
                                color: user_auth,
                              ),
                              TFlabeltext: 'Phone Number',
                              TFinitialvalue: '01********',
                              isvisible: false,
                            ),
                            UserProfile_TFF(
                              TFprefixicon: Icon(
                                Icons.lock,
                                color: user_auth,
                              ),
                              TFlabeltext: 'Password',
                              TFinitialvalue: '********',
                              isvisible: true,
                            ),
                            UserProfile_TFF(
                              TFprefixicon: Icon(
                                Icons.location_on,
                                color: user_auth,
                              ),
                              TFlabeltext: 'Location',
                              TFinitialvalue: 'My City',
                              isvisible: false,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
