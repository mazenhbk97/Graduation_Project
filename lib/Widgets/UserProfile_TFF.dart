import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:re7al/Widgets/Constants.dart';

class UserProfile_TFF extends StatefulWidget {
  UserProfile_TFF(
      {this.TFlabeltext,
      this.TFinitialvalue,
      this.TFprefixicon,
      this.isvisible});
  String TFinitialvalue;
  String TFlabeltext;
  Icon TFprefixicon;
  bool isvisible = false;

  @override
  _UserProfile_TFFState createState() => _UserProfile_TFFState();
}

class _UserProfile_TFFState extends State<UserProfile_TFF> {
  bool editinfo = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isvisible,
      initialValue: widget.TFinitialvalue,
      readOnly: editinfo,
      decoration: InputDecoration(
        labelText: widget.TFlabeltext,
        prefixIcon: widget.TFprefixicon,
        suffixIcon: IconButton(
          alignment: Alignment.centerLeft,
          icon: Icon(
            Icons.edit,
            color: user_auth,
          ),
          onPressed: () {
            setState(() {
              if (editinfo == true) {
                editinfo = false;
              } else {
                editinfo = true;
              }
              ;
            });
          },
        ),
      ),
    );
  }
}
