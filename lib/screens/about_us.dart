import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "\n\ "
              "\n\ Designer:  "
              "\n\      1- Abdelrhman Gomaa"
              "\n\ "
              "\n\ Flutter team:   "
              "\n\      1- Mazen Ahmed "
              "\n\      2- Maha Alaa "
              "\n\ "
              "\n\ Back-end Team:"
              "\n\      1- Arwa Abdelraheem"
              "\n\      2- Esraa Amin "
              "\n\ "
              "\n\ Web Team:"
              "\n\      1- Ahmed Abdelhalim"
              "\n\      2- Aya Gamal  "
              "\n\      3- Seif Elnagar"
              "\n\ "
              "\n\ Mail to contact us: "
              "\n\       - aporehal@gmail.com "
              "\n\ "
              "\n\ Phone Number: "
              "\n\       - 201552619757 ",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}