import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:re7al/Widgets/Constants.dart';

enum Gender { VisaCard, MasterCard, Fawry, Cash }

class BookingDialogue extends StatefulWidget {
  var StudentTicketPrice;
  var EgyptianTicketPrice;
  var ForeignerTicketPrice;
  var ArabTicketPrice;

  @override
  _BookingDialogueState createState() => _BookingDialogueState();
}

class _BookingDialogueState extends State<BookingDialogue> {
  bool _value = false;
  int val = -1;
  DropDownItemModel _dropDownItemModel;
  void initState() {
    super.initState();
    _dropDownItemModel = _dropDownItemModelList[0];
  }

  List<DropDownItemModel> _dropDownItemModelList = [
    DropDownItemModel(versionName: "Student"),
    DropDownItemModel(versionName: "Egyptian"),
    DropDownItemModel(versionName: "Foreigner"),
    DropDownItemModel(versionName: "Arab"),
  ];

  @override
  String timeToVisit;
  int _n = 0;
  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      _n--;
    });
  }

  Gender _genderValue = Gender.VisaCard;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Booking ',
                style: TextStyle(
                  fontSize: 15,
                  color: font_color,
                ),
              ),
              TextSpan(
                text: "Tickets",
                style:
                    TextStyle(color: font_color, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Time to visit: $timeToVisit',
                    style: TextStyle(color: font_color),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Full name ',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: bk_color,
                    filled: true,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Number of tickets: ',
                    style: TextStyle(color: font_color),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        child: new FloatingActionButton(
                          onPressed: minus,
                          child: new Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 20,
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: new Text(
                          '$_n',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        height: 30,
                        child: new FloatingActionButton(
                          onPressed: add,
                          child: new Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 20,
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Type of ticket',
                    style: TextStyle(color: font_color),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: bk_color,
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: DropdownButton<DropDownItemModel>(
                      underline: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.transparent))),
                      ),
                      iconEnabledColor: user_auth,
                      items: _dropDownItemModelList
                          .map((dropDownItemModel) =>
                              DropdownMenuItem<DropDownItemModel>(
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Pay Methods:',
                    style: TextStyle(color: font_color),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  // Card(
                  //   elevation: 2,
                  //   child: RadioListTile(
                  //     title: const Text('Pay with VisaCard'),
                  //     value: Gender.VisaCard,
                  //     groupValue: _genderValue,
                  //     onChanged: (Gender value) {
                  //       setState(() {
                  //         _genderValue = value;
                  //       });
                  //     },
                  //   ),
                  // ),
                  Card(
                    elevation: 2,
                    child: RadioListTile(
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Pay with MasterCard ',
                              style: TextStyle(color: Colors.black),
                            ),
                            WidgetSpan(
                              child: Image.asset(
                                'images/MasterCard.png',
                                height: 30,
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      value: Gender.MasterCard,
                      groupValue: _genderValue,
                      onChanged: (Gender value) {
                        setState(() {
                          _genderValue = value;
                        });
                      },
                    ),
                  ),
                  Card(
                    elevation: 2,
                    child: RadioListTile(
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Pay with Visa ',
                              style: TextStyle(color: Colors.black),
                            ),
                            WidgetSpan(
                              child: Image.asset(
                                'images/Visa.png',
                                height: 30,
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      value: Gender.Fawry,
                      groupValue: _genderValue,
                      onChanged: (Gender value) {
                        setState(() {
                          _genderValue = value;
                        });
                      },
                    ),
                  ),
                  Card(
                    elevation: 2,
                    child: RadioListTile(
                      //subtitle: Text("Use when strictly necessary "),
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Pay with Cash ',
                              style: TextStyle(color: Colors.black),
                            ),
                            WidgetSpan(
                              child: Image.asset(
                                'images/Cash.png',
                                height: 30,
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      value: Gender.Cash,
                      groupValue: _genderValue,
                      onChanged: (Gender value) {
                        setState(() {
                          _genderValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 80, left: 100),
          child: Container(
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: user_auth,
            ),
            child: FlatButton(
              child: Text(
                'Book Now',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropDownItemModel {
  String versionName;

  DropDownItemModel({this.versionName});
}

// RadioListTile(
//   title: const Text('Egyptian'),
//   value: Gender.Egyptian,
//   groupValue: _genderValue,
//   onChanged: (Gender value) {
//     setState(() {
//       _genderValue = value;
//     });
//   },
// ),
// RadioListTile(
//   title: const Text('Foreigner'),
//   value: Gender.Foreigner,
//   groupValue: _genderValue,
//   onChanged: (Gender value) {
//     setState(() {
//       _genderValue = value;
//     });
//   },
// ),
