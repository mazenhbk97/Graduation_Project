import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('FAQ'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "\n\      There are many problems that face us when going to a new place in any province or city, and one of the most common of these problems is the lack ofknowledge of this place and the consequent lack of knowledge of the best placesand services in it, which is the closest and how to reach it. "
              "\n\ "
              "\n\      And when we use the Google platform to know the assessment of places to make the best choice, we find that this evaluation is made by the owners of the places and therefore we cannot know which is better for the personal experience.  "
              "\n\ "
              "\n\      We also face problems with the Google Maps application when using it to choose a place and go to it, especially in Egypt, due to the permanent change in the terrain of the road and the similar designations for most places, an example of this is the presence of more than one petrol in Egypt bearing the name of the cooperation gasoline and other such examples ...... "
              "\n\ "
              "\n\      Based on that, we came up with the idea of making this project 'mobile application and web page' to help people choose the best city or place that can be visited through a detailed presentation of this city in terms of : its tourist attractions, its nature, social and entertainment services."
              "\n\ "
              "\n\      In addition to evaluating these places, but by people, those who visited it personally and that help people choose the best place and reach easily through detailed maps. ",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
