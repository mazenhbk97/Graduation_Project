import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickUpUserPP extends StatefulWidget {
  @override
  _PickUpUserPPState createState() => _PickUpUserPPState();
}

class _PickUpUserPPState extends State<PickUpUserPP> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
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
            child: Container(
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
              child: _image == null
                  ? Icon(
                      Icons.person_rounded,
                      size: 100,
                      color: Colors.blueGrey,
                    )
                  : Image.file(
                      _image,
                      fit: BoxFit.fill,
                    ),
            ),
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
                border: Border.all(color: Colors.blueGrey, width: 2),
              ),
              child: IconButton(
                onPressed: getImage,
                icon: Icon(
                  Icons.camera_alt_rounded,
                  size: 25,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
