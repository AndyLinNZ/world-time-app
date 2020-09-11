import 'dart:convert';
// import "package:flutter/material.dart";
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String url;
  String location;
  String time;
  bool dayTime;

  WorldTime({this.url, this.location});

  Future<void> setTime() async {
    try {
      // Make request from API
      Response response =
          await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);

      // Get time from data
      String _dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(_dateTime);
      now = now.add(new Duration(hours: int.parse(offset)));
      dayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "Could not get the time";
    }
  }
}
