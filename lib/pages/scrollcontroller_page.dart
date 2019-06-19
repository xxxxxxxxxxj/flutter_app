import 'package:flutter/material.dart';

class ScrollControllerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollControllerPageState();
  }
}

class _ScrollControllerPageState extends State<ScrollControllerPage> {
  var _scrollController = ScrollController();
  var _showBackTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        // _scrollController.position.pixels 获取当前滚动部件滚动的距离
        // window.physicalSize.height 获取屏幕高度
        // 当滚动距离大于 800 后，显示回到顶部按钮
        _showBackTop = _scrollController.position.pixels >= 800;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollControllerPage Demo'),
      ),
      body: ListView(
        controller: _scrollController,
        children: List.generate(
            100,
            (index) => Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text('Item${index + 1}'),
                )),
      ),
      floatingActionButton: _showBackTop
          ? FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: Duration(microseconds: 500),
                    curve: Curves.decelerate);
              },
              child: Icon(Icons.vertical_align_top),
            )
          : null,
    );
  }
}
