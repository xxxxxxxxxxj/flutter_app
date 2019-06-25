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
  double width = 100;
  double height = 100;

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
              width: width,
              height: height,
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
            onPanDown: (details) {
              setState(() {
                left = details.globalPosition.dx;
                top = details.globalPosition.dy;
              });
            },
            onPanUpdate: (details) {
              setState(() {
                left = details.globalPosition.dx;
                top = details.globalPosition.dy;
              });
            },
            onPanCancel: () {
              setState(() {
                left = 0;
                top = 0;
              });
            },
            onPanEnd: (details) {
              setState(() {
                left = 0;
                top = 0;
              });
            },
            /*onScaleUpdate: (details) {
              setState(() {
                width = width * details.scale;
                height = height * details.scale;
              });
            },*/
          )
        ],
      ),
    );
  }
}
