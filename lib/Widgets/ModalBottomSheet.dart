import 'package:flutter/material.dart';
import 'package:re7al/Widgets/Constants.dart';

class BottomSheetModal extends StatefulWidget {
  const BottomSheetModal({Key key}) : super(key: key);

  @override
  _BottomSheetModalState createState() => _BottomSheetModalState();
}

class _BottomSheetModalState extends State<BottomSheetModal> {
  bool fav = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: font_color,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person_outline_rounded),
              foregroundColor: font_color,
            ),
          ),
          title: Text('UserName'),
          subtitle: Text('this is my comment'),
          trailing: Icon(
            Icons.arrow_drop_up_sharp,
            size: 40,
            color: font_color,
          ),
          onTap: () {
            showModalBottomSheet<void>(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                      color: font_color,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  height: 300,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(80),
                                        color: Colors.white),
                                    child: CircleAvatar(
                                      backgroundColor: font_color,
                                      radius: 10,
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  hintText: '   Add a public comment',
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.arrow_forward),
                                  ),
                                ),
                              ),
                            ),
                            MBS_comment(),
                            MBS_comment(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class MBS_comment extends StatefulWidget {
  const MBS_comment({Key key}) : super(key: key);

  @override
  _MBS_commentState createState() => _MBS_commentState();
}

class _MBS_commentState extends State<MBS_comment> {
  @override
  bool fav = true;

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: font_color,
                radius: 19,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              width: 300,
              child: ListTile(
                trailing: IconButton(
                  iconSize: 30,
                  icon: Icon(
                    fav ? Icons.favorite_outline_outlined : Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      fav = !fav;
                    });
                  },
                ),
                title: Text(
                  'UserName',
                ),
                subtitle: Text('This is a comment'),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Row(
            children: [
              Text(
                '4h',
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                child: Text(
                  'reply',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
