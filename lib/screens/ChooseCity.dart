import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:re7al/Models/city.dart';
import 'package:re7al/providers/city_provider.dart';

class ChooseCity extends StatefulWidget {
  @override
  _ChooseCityState createState() => _ChooseCityState();
}

class _ChooseCityState extends State<ChooseCity> {
  bool selected = false;

  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<City> cities = Provider.of<CityProvider>(context).cities;
    List<String> _suggestions = cities.map((e) => e.name).toList();
    print("suggestions ${cities.toString()}");
    FocusNode focusNode = FocusNode();
    return Column(
      children: [
        Text("Which city you want to explore?"),
        TypeAheadField<String>(
            noItemsFoundBuilder: (context) => new ListTile(
                  title: new Text('Your input did not match any station !'),
                ),
            suggestionsCallback: (input) {
              return _suggestions.where((element) =>
                  element.toLowerCase().contains(input.toLowerCase()));
            },
            onSuggestionSelected: (value) {
              setState(() {
                controller.text = value;
                selected = true;
                FocusScope.of(context).requestFocus(focusNode);
              });
            },
            // itemFilter: (suggestion, input) =>
            //     suggestion.toLowerCase().contains(input.toLowerCase()),
            itemBuilder: (context, suggestion) => new Padding(
                child: new ListTile(
                  title: new Text(suggestion),
                ),
                padding: EdgeInsets.all(8.0)),
            textFieldConfiguration: TextFieldConfiguration(
                focusNode: focusNode,
                controller: controller,
                onSubmitted: (v) {
                  if (!selected) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Please choose a city !"),
                    ));
                    return;
                  }
                  Provider.of<CityProvider>(context, listen: false)
                      .selectCity(v);
                },
                style: TextStyle(color: Colors.black),
                autofocus: true,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ))))
      ],
    );
  }
}
