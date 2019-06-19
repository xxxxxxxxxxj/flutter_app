import 'package:flutter/material.dart';

class SliverPersistentHeaderPage extends StatelessWidget {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: CustomSliverPersistentHeaderDelegate(
                max: 300,
                min: 100,
                child: Text(
                  '我是一个头部控件',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )),
            pinned: true,
            floating: true,
          ),
          // 这个部件一般用于最后填充用的，会占有一个屏幕的高度，
          // 可以在 child 属性加入需要展示的部件
          SliverFillRemaining(
            child: Center(
              child: Text(
                'SliverPersistentHeaderPage',
                style: TextStyle(fontSize: 50, color: Colors.brown),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double max; //最大高度
  final double min; //最小高度
  final Widget child; //需要展示的内容

  CustomSliverPersistentHeaderDelegate(
      {@required this.max, @required this.min, @required this.child})
      : assert(max != null),
        assert(min != null),
        assert(child != null),
        assert(min <= max),
        super();

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      child;

  @override
  double get maxExtent => max; // 最大高度

  @override
  double get minExtent => min; // 最小高度

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // 是否需要更新，这里我们定义当高度范围和展示内容被替换的时候进行刷新界面
    return max != oldDelegate.maxExtent ||
        min != oldDelegate.minExtent ||
        child != oldDelegate.child;
  }
}

class DemoHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Colors.pink,
        alignment: Alignment.center,
        child: Text('我是一个头部部件',
            style: TextStyle(color: Colors.white, fontSize: 30.0)));
  } // 头部展示内容

  @override
  double get maxExtent => 300.0; // 最大高度

  @override
  double get minExtent => 100.0; // 最小高度

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>
      false; // 因为所有的内容都是固定的，所以不需要更新
}
