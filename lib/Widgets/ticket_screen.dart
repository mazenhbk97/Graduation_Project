import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:re7al/data_models/ticket.dart';
import 'package:re7al/providers/auth_provider.dart';
import 'package:re7al/providers/booking_provider.dart';

class TicketWithQrCode extends StatelessWidget {
  final String placeName;
  TicketWithQrCode(this.placeName);
  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<AuthProvider>(context).user.name;
    final bookId = Provider.of<BookingProvider>(context).bookingId;
    print("bookId :$bookId");
    return Container(
        color: Colors.white,
        child: Column(children: [
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "place: $placeName",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  "name: $userName",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Spacer(),
          Center(
            child: QrImage(
              data: bookId,
              size: 300,
            ),
          ),
          Spacer()
        ]));
  }
}
