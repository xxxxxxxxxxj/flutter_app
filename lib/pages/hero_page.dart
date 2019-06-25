import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HeroPage Demo'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: InkWell(
          child: Hero(
              tag: 'hero_tag', // 这里指定 tag
              child: Image.asset(
                'images/ali.jpg',
                width: 100.0,
                height: 100.0,
              )),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => HeroDemoPage())),
        ),
      ),
    );
  }
}

class HeroDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: InkWell(
          child: Hero(
              tag: "hero_tag",
              child: Image.asset(
                'images/ali.jpg',
                width: 200.0,
                height: 200.0,
              )),
          onTap: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
