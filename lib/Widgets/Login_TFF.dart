import 'package:flutter/material.dart';

// ignore: camel_case_types
// ignore: must_be_immutable
class Login_TFF extends StatefulWidget {
  Function saveName;
  Function savePassword;

  Login_TFF({@required this.saveName, @required this.savePassword});

  @override
  _Login_TFFState createState() => _Login_TFFState();
}

class _Login_TFFState extends State<Login_TFF> {
  String _email;
  String _password;
  bool passvisible = true;
  var formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();

  Widget _buildPassword() {
    return TextFormField(
      controller: _pass,
      decoration: InputDecoration(
        hintText: '**********',
        labelText: ' Password',
        suffixIcon: IconButton(
          icon: Icon(passvisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              passvisible = !passvisible;
            });
          },
        ),
      ),
      obscureText: passvisible,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        print("hello pass :$value");
        _password = value;
        widget.savePassword(value);
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Email', hintText: 'UserName@gmail.com'),
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
      onSaved: (String value) {
        _email = value;
        print("hello mail :$value");

        widget.saveName(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        _buildEmail(),
        _buildPassword(),
      ],
    ));
  }
}
