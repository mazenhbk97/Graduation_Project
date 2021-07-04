import 'package:flutter/material.dart';

class ExploreAlert extends StatefulWidget {
  @override
  _ExploreAlertState createState() => _ExploreAlertState();
}

class _ExploreAlertState extends State<ExploreAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select your city'),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 1; i <= 3; i++)
            ListTile(
              title: Text(
                'option $i',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.blue),
              ),
              leading: Radio(
                value: i,
                groupValue: 1,
                onChanged: (_) {},
              ),
            ),
        ],
      ),
      actions: [
        FlatButton(
          textColor: Colors.blue,
          onPressed: () => Navigator.pop(context),
          child: Text('ACTION 1'),
        ),
      ],
    );
  }
}
