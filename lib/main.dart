import 'package:flutter/material.dart';
import 'package:re7al/Widgets/BDContent.dart';
import 'package:provider/provider.dart';
import 'package:re7al/Widgets/ModalBottomSheet.dart';
import 'package:re7al/providers/auth_provider.dart';
import 'package:re7al/providers/city_provider.dart';
import 'package:re7al/providers/places_provider.dart';
import 'package:re7al/screens/AppNotf.dart';
import 'package:re7al/screens/Clubs.dart';
import 'package:re7al/screens/ExplorePlaces.dart';
import 'package:re7al/screens/FAQ.dart';
import 'package:re7al/screens/Favorites.dart';
import 'package:re7al/screens/Food.dart';
import 'package:re7al/screens/Hospital.dart';
import 'package:re7al/screens/Museums.dart';
import 'package:re7al/screens/Settings.dart';
import 'package:re7al/screens/SplashScreens.dart';
import 'package:re7al/screens/UserProfile.dart';
import 'package:re7al/screens/Login.dart';
import 'package:re7al/screens/ForgotPass.dart';
import 'package:re7al/screens/SignUp.dart';
import 'package:re7al/screens/test.dart';
import 'package:re7al/screens/SideMenu.dart';
import 'screens/HomeScreen.dart';
import 'package:re7al/screens/Place.dart';
import 'package:re7al/screens/ContactUs.dart';
import 'package:re7al/screens/ChooseCity.dart';
import 'package:re7al/screens/PromoScreen.dart';
import 'package:re7al/screens/FullScreenMap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: AuthProvider()),
          ChangeNotifierProvider.value(value: PlacesProvider()),
          ChangeNotifierProvider.value(value: CityProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => SplashScreens(),
            'HomeScreen': (context) => HomeScreen(),
            'UserProfile': (context) => UserProfile(),
            'ExplorePlaces': (context) => ExplorePlaces(),
            'Favorites': (context) => Favorites(),
            'Museums': (context) => Museums(),
            'Food': (context) => Food(),
            'Hospital': (context) => Hospital(),
            'Clubs': (context) => Clubs(),
            'Login': (context) => Login(),
            'SignUp': (context) => SignUp(),
            'ForgotPass': (context) => ForgotPass(),
            'test': (context) => test(),
            'SideMenu': (context) => SideMenu(),
            'Settings': (context) => Settings(),
            'BDContent': (context) => BDContent(),
            'ModalBottomSheet': (context) => BottomSheetModal(),
            Place.routeName: (context) => Place(),
            'ContactUs': (context) => ContactUs(),
            'FAQ': (context) => FAQ(),
            'AppNotf': (context) => AppNotf(),
          },
        ));
  }
}
