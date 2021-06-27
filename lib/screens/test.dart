import 'package:flutter/material.dart';
import 'package:re7al/Widgets/BookingDialogue.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:re7al/Widgets/Map.dart';

enum Gender { Student, Egyptian, Foreigner }

class test extends StatefulWidget {
  const test({Key key}) : super(key: key);

  @override
  _testState createState() => _testState();
}

/*title: const Text('Egyptian'),
              value: Gender.Egyptian,
              groupValue: _genderValue,
              onChanged: (Gender value) {
                setState(() {
                  _genderValue = value;
                });
              },
            ),*/
class _testState extends State<test> {
  Gender _genderValue = Gender.Student;
  List<String> PayMethod = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: SimpleDialog(
          children: [
            Container(
              height: 200,
              width: 180,
              child: ListView.builder(
                  itemCount: PayMethod.length,
                  itemBuilder: (BuildContext context, int position) {
                    var name = PayMethod[position];
                    return Card(
                        margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                        child: ListTile(title: Text('')));
                  }),
            ),
          ],
        )),
      ),
    );
  }
}
