import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:re7al/Widgets/PickUpUserPP.dart';
import 'package:re7al/Widgets/UserProfile_TFF.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:re7al/data_models/user.dart';
import 'package:re7al/providers/auth_provider.dart';
import 'package:re7al/screens/Login.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isLoading = false;
  // initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero).then((_) async {
  //     bool isAuth =
  //         await Provider.of<AuthProvider>(context, listen: false).isAuth;

  //     if (isAuth) {
  //       String token = Provider.of<AuthProvider>(context, listen: false).token;
  //       await Provider.of<ProfileProvider>(context, listen: false)
  //           .getProfile(token);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future: Provider.of<AuthProvider>(context, listen: false).getProfile(),
        builder: (context, user) =>
            user.connectionState == ConnectionState.waiting
                ? Scaffold(
                    body: Center(
                    child: CircularProgressIndicator(),
                  ))
                : user.data == null
                    ? Login()
                    : Stack(
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
                                    tooltip: MaterialLocalizations.of(context)
                                        .openAppDrawerTooltip,
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
                                      PickUpUserPP(user.data.imgUrl),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 40,
                                          left: 20,
                                          right: 20,
                                          bottom: 20,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
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
                                                TFinitialvalue: user.data.name,
                                                isvisible: false,
                                              ),
                                              UserProfile_TFF(
                                                TFprefixicon: Icon(
                                                  Icons.mail,
                                                  color: user_auth,
                                                ),
                                                TFlabeltext: 'E-mail',
                                                TFinitialvalue: user.data.email,
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
                      ));
  }
}
