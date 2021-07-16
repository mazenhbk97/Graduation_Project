import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:re7al/helpers/public.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BookingProvider with ChangeNotifier {
  String _bookingId;

  String get bookingId {
    return _bookingId;
  }

  Future<void> newBooking(String placeId, int quantity) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final token = prefs.getString("token");
      print(token);
      final url = Uri.parse('${Public.baseUrl}/bookings/newBooking/$placeId');
      final response = await http.post(url,
          body: jsonEncode({"ticketsNo": quantity.toString()}),
          headers: {"auth-token": token, "Content-Type": "application/json"});
      final data = jsonDecode(response.body);
      _bookingId = data["id"];
      notifyListeners();
    } catch (e) {
      print("bookingError $e");
      throw e;
    }
  }
}
