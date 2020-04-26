import 'package:flutter/material.dart';

void main() => runApp(GettingStartedApp());

class GettingStartedApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Getting Started",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("App bar Title")
        ),
        body: new Center(
          child: new Text("new Center"),
        )
      )
    );
  }
}
