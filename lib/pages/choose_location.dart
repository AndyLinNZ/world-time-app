import "package:flutter/material.dart";
import "package:world_app/services/world_time.dart";
import 'package:http/http.dart';
import 'dart:convert';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: "Australia/Melbourne", location: "Melbourne"),
    WorldTime(url: "America/Chicago", location: "Chicago"),
    WorldTime(url: "America/Toronto", location: "Toronto"),
    WorldTime(url: "America/Vancouver", location: "Vancouver"),
    WorldTime(url: "Asia/Tokyo", location: "Tokyo"),
    WorldTime(url: "Asia/Seoul", location: "Seoul"),
    WorldTime(url: "Asia/Shanghai", location: "Shanghai"),
    WorldTime(url: "Asia/Taipei", location: "Taipei"),
    WorldTime(url: "Asia/Dubai", location: "Dubai"),
    WorldTime(url: "Asia/Kuala_Lumpur", location: "Kuala Lumpur"),
    WorldTime(url: "Asia/Singapore", location: "Singapore"),
    WorldTime(url: "Europe/London", location: "London"),
    WorldTime(url: "Europe/Madrid", location: "Madrid"),
    WorldTime(url: "Europe/Moscow", location: "Moscow"),
    WorldTime(url: "Europe/Paris", location: "Paris"),
    WorldTime(url: "Pacific/Auckland", location: "Auckland"),
    WorldTime(url: "Pacific/Fiji", location: "Fiji"),
  ];

  void sendInformation(int index) async {
    WorldTime instance = locations[index];
    await instance.setTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'dayTime': instance.dayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose your location"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    sendInformation(index);
                  },
                  title: Text(locations[index].location),
                ),
              );
            }));
  }
}
