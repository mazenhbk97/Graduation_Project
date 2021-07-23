import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re7al/Models/city.dart';
import 'package:re7al/providers/city_provider.dart';

class ChooseCityAlert extends StatefulWidget {
  @override
  _ChooseCityAlertState createState() => _ChooseCityAlertState();
}

class _ChooseCityAlertState extends State<ChooseCityAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Choose Destination"),
      content: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * .3,
          width: MediaQuery.of(context).size.height * .8,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: FutureBuilder<List<City>>(
                  future: Provider.of<CityProvider>(context, listen: false)
                      .fetchCities(),
                  builder: (ctx, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? Center(child: CircularProgressIndicator())
                          : Container(
                              height: MediaQuery.of(context).size.height * .4,
                              width: MediaQuery.of(context).size.width * .5,
                              child: GridView(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: .2,
                                  mainAxisSpacing: .2,
                                  childAspectRatio: 1.7,
                                ),
                                children: snapshot.data
                                    .map((e) => ChipButton(e.name))
                                    .toList(),
                              ),
                            ))),
        ),
      ),
    );
  }
}

class ChipButton extends StatelessWidget {
  final String cityName;

  ChipButton(this.cityName);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: MaterialButton(
          onPressed: () {
            City city =
                Provider.of<CityProvider>(context, listen: false).selectedCity;
            if (city != null) {
              Navigator.of(context).pop();
            }
            Provider.of<CityProvider>(context, listen: false)
                .selectCity(cityName);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          textColor: Colors.black,
          color: Colors.blue[300],
          splashColor: Colors.blue[900],
          disabledColor: Colors.grey,
          disabledTextColor: Colors.white,
          child: Text(
            cityName,
            softWrap: true,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
