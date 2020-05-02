import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() => runApp(new  RealWorldApp());

class RealWorldApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RealWorldState();  
  }
}

  
class RealWorldState  extends State<RealWorldApp>{
  var _isLoading = true;

  _fetchData() async{
    print("Attempting to fetch data from networks");

    final url = "http://api.letsbuildthatapp.com/youtube/home_feed";
    final response = await http.get(url);

    if (response.statusCode == 200){
      print(response.body);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Real World App Bar"),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.refresh), 
            onPressed: (){
              print("Reloading....");
              setState(() {
                _isLoading = false;
              });

              _fetchData();
            })
          ],
        ),
        body: new Center(
          child: _isLoading ?  new CircularProgressIndicator():
          new Text("Loading is Finished...."),
        ),
      ),
    );
  }
}