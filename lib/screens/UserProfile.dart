import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:re7al/Widgets/PickUpUserPP.dart';
import 'package:re7al/Widgets/UserProfile_TFF.dart';
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
          backgroundColor: Colors.blueGrey,
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
                  PickUpUserPP(),
                  Container(
                    margin: EdgeInsets.only(
                      top: 40,
                      left: 30,
                      right: 30,
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
                            TFprefixicon: Icon(Icons.person_rounded),
                            TFlabeltext: 'Name',
                            TFinitialvalue: 'My Name',
                            isvisible: false,
                          ),
                          UserProfile_TFF(
                            TFprefixicon: Icon(Icons.mail),
                            TFlabeltext: 'E-mail',
                            TFinitialvalue: 'My_Name@gmail.com',
                            isvisible: false,
                          ),
                          UserProfile_TFF(
                            TFprefixicon: Icon(Icons.phone),
                            TFlabeltext: 'Phone Number',
                            TFinitialvalue: '01********',
                            isvisible: false,
                          ),
                          UserProfile_TFF(
                            TFprefixicon: Icon(Icons.lock),
                            TFlabeltext: 'Password',
                            TFinitialvalue: '********',
                            isvisible: true,
                          ),
                          UserProfile_TFF(
                            TFprefixicon: Icon(Icons.location_on),
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
      ],
    );
  }
}
