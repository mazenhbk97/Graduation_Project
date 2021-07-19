import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re7al/Models/Places.dart';
import 'package:re7al/Widgets/Constants.dart';
import 'package:re7al/Widgets/ModalBottomSheet.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:re7al/data_models/place.dart';
import 'package:re7al/helpers/servicesData.dart';
import 'package:re7al/providers/places_provider.dart';
import 'package:readmore/readmore.dart';
import 'package:re7al/Widgets/Map.dart';
import 'package:re7al/Widgets/BookingDialogue.dart';

class Place extends StatefulWidget {
  PlaceModel place;
  Place(this.place);
  static const routeName = 'Place';

  @override
  _PlaceState createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  TabController _tabController;

  bool fav = true;
  bool available = true;
  String typeOfPlace;
  String timeToVisit;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isFav = Provider.of<PlacesProvider>(context).isFav(widget.place.id);
    print("isFav :$isFav");
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: bk_color,
          body: Column(
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    height: 230,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(80.0),
                        bottomLeft: Radius.circular(80.0),
                      ),
                      image: DecorationImage(
                        image: widget.place.image == null
                            ? AssetImage("images/bestPlaces.png")
                            : NetworkImage(widget.place.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: TabBar(
                          controller: _tabController,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                            color: Color(0xff2f4f4f),
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(
                              child: Text(
                                'Details',
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Locations',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 10, right: 10, bottom: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FittedBox(
                                    child: Text(widget.place.name,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  CircleAvatar(
                                    radius: 22,
                                    backgroundColor: font_color,
                                    child: Center(
                                      child: IconButton(
                                        iconSize: 30,
                                        icon: Icon(
                                          isFav
                                              ? Icons.favorite
                                              : Icons.favorite_outline_outlined,
                                          color: Colors.red,
                                        ),
                                        onPressed: () async {
                                          await Provider.of<PlacesProvider>(
                                                  context,
                                                  listen: false)
                                              .favourite(widget.place);
                                          setState(() {
                                            isFav = false;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RatingBar.builder(
                                  allowHalfRating: true,
                                  itemSize: 25,
                                  initialRating: widget.place.rating == null
                                      ? 0.0
                                      : widget.place.rating,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 1),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amberAccent,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.amberAccent,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(
                                      widget.place.rating == null
                                          ? "rating: N/F"
                                          : '${widget.place.rating} Stars',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    widget.place.reviews == null
                                        ? 'reviews: N/F'
                                        : ' ${widget.place.reviews} Reviews ',
                                    style: TextStyle(color: font_color),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20, right: 20, left: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    15.0,
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ReadMoreText(
                                    widget.place.description != null
                                        ? widget.place.description
                                        : 'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                                    style: TextStyle(color: font_color),
                                    trimLines: 2,
                                    colorClickableText: Colors.red,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Read more',
                                    trimExpandedText: ' show less',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Available to visit ",
                                          style: TextStyle(
                                              color: font_color,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        WidgetSpan(
                                          child: Icon(
                                              available
                                                  ? Icons
                                                      .check_circle_outline_rounded
                                                  : Icons
                                                      .radio_button_unchecked_rounded,
                                              color: Colors.green,
                                              size: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Place Type: ${services[widget.place.serviceId]}',
                                    style: TextStyle(
                                        color: font_color,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Time to visit: $timeToVisit',
                                    style: TextStyle(
                                        color: font_color,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    height: 25,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: font_color,
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 5.0,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                      color: font_color,
                                    ),
                                    child: FlatButton(
                                      child: Text(
                                        'Booking',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        //style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  BookingDialogue(
                                                      widget.place));
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20, left: 20, top: 20, bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Photos ',
                                    style: TextStyle(
                                        color: font_color,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: widget.place.media.isEmpty
                                  ? Row(
                                      children: [null, null, null]
                                          .map((e) => Story(e))
                                          .toList(),
                                    )
                                  : Row(
                                      children: widget.place.media
                                          .map((e) => Story(e))
                                          .toList()),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //       top: 20, bottom: 10, right: 15, left: 15),
                            //   child: Container(
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(25),
                            //       color: Colors.white,
                            //     ),
                            //     child: ListTile(
                            //       leading: CircleAvatar(
                            //         backgroundColor: font_color,
                            //         child: CircleAvatar(
                            //           backgroundColor: Colors.white,
                            //           child: Icon(Icons.person_outline_rounded),
                            //           foregroundColor: font_color,
                            //         ),
                            //       ),
                            //       title: Text('UserName'),
                            //       subtitle: Text('this is my comment'),
                            //       trailing: Icon(
                            //         Icons.arrow_drop_up_sharp,
                            //         size: 40,
                            //         color: font_color,
                            //       ),
                            //       onTap: () {
                            //         showModalBottomSheet<void>(
                            //           shape: RoundedRectangleBorder(
                            //               borderRadius:
                            //                   BorderRadius.circular(20)),
                            //           isScrollControlled: true,
                            //           context: context,
                            //           builder: (BuildContext context) {
                            //             return Container(
                            //               decoration: BoxDecoration(
                            //                   color: font_color,
                            //                   borderRadius: BorderRadius.only(
                            //                       topRight: Radius.circular(20),
                            //                       topLeft:
                            //                           Radius.circular(20))),
                            //               height: 200,
                            //               child: Center(
                            //                 child: SingleChildScrollView(
                            //                   child: Padding(
                            //                     padding:
                            //                         const EdgeInsets.symmetric(
                            //                             horizontal: 25),
                            //                     child: Column(
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment.center,
                            //                       mainAxisSize:
                            //                           MainAxisSize.min,
                            //                       children: <Widget>[
                            //                         Container(
                            //                           decoration: BoxDecoration(
                            //                             borderRadius:
                            //                                 BorderRadius
                            //                                     .circular(50.0),
                            //                             color: Colors.white,
                            //                           ),
                            //                           height: 4,
                            //                           width: 40,
                            //                         ),
                            //                         Padding(
                            //                           padding:
                            //                               const EdgeInsets.only(
                            //                                   top: 20,
                            //                                   bottom: 10),
                            //                           child: TextFormField(
                            //                             decoration:
                            //                                 InputDecoration(
                            //                               prefixIcon: Icon(
                            //                                 Icons.person,
                            //                                 color: Colors.white,
                            //                               ),
                            //                               hintText:
                            //                                   '   Add a public comment',
                            //                               suffixIcon:
                            //                                   IconButton(
                            //                                 icon: Icon(Icons
                            //                                     .arrow_forward),
                            //                               ),
                            //                             ),
                            //                           ),
                            //                         ),
                            //                         Container(
                            //                           decoration: BoxDecoration(
                            //                             borderRadius:
                            //                                 BorderRadius
                            //                                     .circular(15),
                            //                             color: bk_color,
                            //                           ),
                            //                           child: ListTile(
                            //                             leading: Icon(Icons
                            //                                 .person_outline_rounded),
                            //                             title: Text('Home'),
                            //                             onTap: () {},
                            //                           ),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             );
                            //           },
                            //         );
                            //       },
                            //     ),
                            //   ),
                            // ),
                            BottomSheetModal(widget.place.id),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Map(
                        lat: widget.place.coordinates[1],
                        long: widget.place.coordinates[0],
                      ),
                    ),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.vertical,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(10),
                    //     child: Column(
                    //       children: [
                    //         Favorite_Card(
                    //           CardName: 'pyramids',
                    //           CardDate: '22 mai 2021 ',
                    //           CardRating: 4.9,
                    //           CardReviews: 19,
                    //         ),
                    //         Favorite_Card(
                    //           CardName: 'pyramids',
                    //           CardDate: '22 mai 2021',
                    //           CardRating: 4.9,
                    //           CardReviews: 19,
                    //         ),
                    //         Favorite_Card(
                    //           CardName: 'pyramids',
                    //           CardDate: '22 mai 2021',
                    //           CardRating: 4.9,
                    //           CardReviews: 19,
                    //         ),
                    //         Favorite_Card(
                    //           CardName: 'pyramids',
                    //           CardDate: '22 mai 2021',
                    //           CardRating: 4.9,
                    //           CardReviews: 19,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
