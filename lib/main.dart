import 'package:flutter/material.dart';

void main() => runApp(GettingStartedApp());

class GettingStartedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        title: "Getting Started",
        home: new Scaffold(
          appBar: new AppBar(title: new Text("App bar Title")),
          body: new HomeWidget(),
        ));
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
      itemCount: 20,
      itemBuilder: (context, rowNumber) {
        return new Container(
            padding: new EdgeInsets.all(16.0),
            child: new Column(children: <Widget>[
              new Image.network("http://shorturl.at/jxBD4"),
              new Text(
                "check new Fallout store",
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ]));
      },
    );
  }
}
