import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './views/video_cell.dart';
import './views/detail_page.dart';

void main() => runApp(new RealWorldApp());

class RealWorldApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RealWorldState();
  }
}

class RealWorldState extends State<RealWorldApp> {
  var _isLoading = true;
  var videos;

  _fetchData() async {
    print("Attempting to fetch data from networks");

    final url = "http://api.letsbuildthatapp.com/youtube/home_feed";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);

      final map = jsonDecode(response.body);
      final videosJson = map["videos"];

      // videosJson.forEach((video){
      //   print(map["videos"]);
      // });

      setState(() {
        _isLoading = false;
        this.videos = videosJson;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Real World App Bar"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.refresh),
                onPressed: () {
                  print("Reloading....");
                  setState(() {
                    _isLoading = false;
                  });

                  _fetchData();
                })
          ],
        ),
        body: new Center(
          child: _isLoading
              ? new CircularProgressIndicator()
              : new ListView.builder(
                  itemCount: this.videos != null ? this.videos.length : 0,
                  itemBuilder: (context, i) {
                    final video = this.videos[i];
                    return new FlatButton(
                      onPressed: (){
                        print("Video cell tapped: $i");
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => new DetailPage()
                          )
                        );
                      }, 
                      child: new VideoCell(video),
                      padding: new EdgeInsets.all(0.0),  
                    );
                  },
                ),
        ),
      ),
    );
  }
}