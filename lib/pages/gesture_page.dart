import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GesturePageState();
  }
}

class _GesturePageState extends State<GesturePage> {
  double left = 0.0;
  double top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GesturePage Demo'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            child: Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
            left: left,
            top: top,
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height,
            ),
            onPanDown: (details) => {},
          )
        ],
      ),
    );
  }
}
