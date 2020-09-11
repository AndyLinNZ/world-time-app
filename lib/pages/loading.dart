import "package:world_app/services/world_time.dart";
import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime worldTime =
        WorldTime(url: "Australia/Melbourne", location: "Melbourne");
    await worldTime.setTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'time': worldTime.time,
      'dayTime': worldTime.dayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SpinKitRotatingCircle(
      color: Colors.lightBlueAccent,
      size: 80.0,
    )));
  }
}
