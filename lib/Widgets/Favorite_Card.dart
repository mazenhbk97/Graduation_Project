import 'package:flutter/material.dart';
import 'package:re7al/Widgets/Constants.dart';

class Favorite_Card extends StatefulWidget {
  Favorite_Card({
    this.CardName,
    this.CardDate,
    this.CardRating,
    this.CardReviews,
  });

  String CardName;
  String CardDate;
  double CardRating;
  int CardReviews;
  @override
  _Favorite_CardState createState() => _Favorite_CardState();
}

class _Favorite_CardState extends State<Favorite_Card> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Card(
        color: Colors.grey.shade400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.CardName,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        widget.CardDate,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.favorite,
                    color: bottom_nav_bar,
                    size: 35,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${widget.CardRating}",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${widget.CardReviews} reviews",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
