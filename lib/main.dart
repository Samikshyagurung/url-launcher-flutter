import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: boarder(),
    );
  }
}
class boarder extends StatefulWidget {
  @override
  _boarderState createState() => _boarderState();
}

class _boarderState extends State<boarder> {
  double padValue = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Welcome!!"),
          ),
          body: Container(
              height: 750,
              width: 450,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 6,

                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Textf()
          ),
        ));
  }
}

class Textf extends StatefulWidget {
  @override
  _TextfState createState() => _TextfState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
class _TextfState extends State<Textf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 270, 0, 0),
              child: Text(
                'Enter your video link',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(30, 8, 30, 0),
              child: TextField(
                  decoration: InputDecoration(
                  hintText:'https://www.youtube.com/watch?v=xBtT2FmuALc',
                  border: InputBorder.none,
            )),
            decoration: BoxDecoration(color: Colors.white,
            border: Border.all(color: Colors.red)),
            ),
            openLink()
          ]
      ),
    );
  }
}

class openLink extends StatefulWidget{
  @override
  _openLinkState createState() => _openLinkState();
}
class _openLinkState extends State<openLink> {
   Future<void> _launched;

 Future<void> _launchyoutube(String url) async{
   if (await canLaunch(url)) {
     await launch(
       url,
       headers: <String, String>{"header_key": "header_value"},
     );
   } else {
     throw "Not Launch $url";
   }
 }

 Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
   if (snapshot.hasError) {
     return Text('Error: ${snapshot.error}');
   } else {
     return const Text("");
   }
 }
 @override
 Widget build(BuildContext context) {
   const String toLaunch = "https://www.youtube.com/watch?v=xBtT2FmuALc";
   return Container(
     margin: EdgeInsets.fromLTRB(150, 150, 0, 0),
     height: 50,
     width: 100,
     color: Colors.red,
     child: Column(
       children: [
          TextButton(
         onPressed: () => setState(() {
            _launched = _launchyoutube(toLaunch);
           }),
            child: Text('Search', style: TextStyle(color: Colors.black),
              ),
          ),
          FutureBuilder<void>(future: _launched, builder: _launchStatus),
          ]),
   );
 }
}
