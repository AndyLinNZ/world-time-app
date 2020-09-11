import "package:flutter/material.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String backgroundImg =
        data["dayTime"] ? "assets/day.jpg" : "assets/night.jpg";
    return Scaffold(
      backgroundColor:
          data["dayTime"] ? Colors.lightBlueAccent : Colors.indigo[800],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(backgroundImg), fit: BoxFit.fill),
          ),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      if (result != null) {
                        data = {
                          'location': result['location'],
                          'time': result['time'],
                          'dayTime': result['dayTime']
                        };
                      }
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[200],
                  ),
                  label: Text("Edit Location",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          letterSpacing: 2))),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 5,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(data['time'],
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.grey[300],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
