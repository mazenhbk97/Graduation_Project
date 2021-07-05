import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:re7al/providers/auth_provider.dart';

class PickUpUserPP extends StatefulWidget {
  String image;
  PickUpUserPP(this.image);
  @override
  _PickUpUserPPState createState() => _PickUpUserPPState();
}

class _PickUpUserPPState extends State<PickUpUserPP> {
  File _image;
  final picker = ImagePicker();
  bool isLoading = false;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        widget.image = null;
      });
      String token = Provider.of<AuthProvider>(context, listen: false).token;
      setState(() {
        isLoading = true;
      });
      print(_image.path);
      await Provider.of<AuthProvider>(context, listen: false)
          .editProfile(token: token, type: 'file', img: _image);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 170,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: isLoading
                ? CircularProgressIndicator()
                : Container(
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white, width: 3),
                      color: Colors.white,
                    ),
                    height: 130,
                    width: 130,
                    child: widget.image == null
                        ? _image == null
                            ? Icon(
                                Icons.person_rounded,
                                size: 100,
                                color: user_auth,
                              )
                            : Image.file(
                                _image,
                                fit: BoxFit.cover,
                              )
                        : Image.network(
                            widget.image,
                            fit: BoxFit.cover,
                          )),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: bk_color, width: 2),
              ),
              child: IconButton(
                onPressed: getImage,
                icon: Icon(
                  Icons.camera_alt_rounded,
                  size: 25,
                  color: user_auth,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
