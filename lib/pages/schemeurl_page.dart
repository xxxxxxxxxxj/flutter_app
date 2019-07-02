import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SchemeUrlPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SchemeUrlPageState();
  }
}

class _SchemeUrlPageState extends State<SchemeUrlPage> {
  _launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SchemeUrlPage Demo"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: _launchURL,
          child: Text('Show Flutter homepage'),
        ),
      ),
    );
  }
}
