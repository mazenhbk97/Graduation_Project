import 'package:flutter/material.dart';
import 'package:re7al/Widgets/Constants.dart';

class BDContent extends StatefulWidget {
  @override
  _BDContentState createState() => _BDContentState();
}

class _BDContentState extends State<BDContent> {
  var StudentTicketPrice;
  var EgyptianTicketPrice;
  var ForeignerTicketPrice;
  var ArabTicketPrice;

  List<DropDownItemModel> _dropDownItemModelList = [
    DropDownItemModel(versionName: "Student"),
    DropDownItemModel(versionName: "Egyptian"),
    DropDownItemModel(versionName: "Foreigner"),
    DropDownItemModel(versionName: "Arab"),
  ];
  DropDownItemModel _dropDownItemModel;
  @override
  void initState() {
    super.initState();
    _dropDownItemModel = _dropDownItemModelList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          color: bk_color,
          child: DropdownButton<DropDownItemModel>(
            underline: Container(
              decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.transparent))),
            ),
            iconEnabledColor: user_auth,
            items: _dropDownItemModelList
                .map((dropDownItemModel) => DropdownMenuItem<DropDownItemModel>(
                      child: Text(dropDownItemModel.versionName),
                      value: dropDownItemModel,
                    ))
                .toList(),
            onChanged: (DropDownItemModel dropDownItemModel) {
              setState(() => _dropDownItemModel = dropDownItemModel);
            },
            hint: Text(
              _dropDownItemModel.versionName,
              style: TextStyle(color: user_auth),
            ),
          ),
        ),
      ),
    );
  }
}

class DropDownItemModel {
  String versionName;

  DropDownItemModel({this.versionName});
}
