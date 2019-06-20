import 'package:flutter/material.dart';

class NestedScrollViewPage extends StatelessWidget {
  var _tabs = ['TabA', 'TabB'];
  var colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.yellow,
    Colors.deepPurple
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: _tabs.length,
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
                    // 传入 handle 值，直接通过 `sliverOverlapAbsorberHandleFor` 获取即可
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      child: SliverAppBar(
                        pinned: true,
                        title: Text('NestedScrollViewPage Demo'),
                        expandedHeight: 200,
                        //设置背景
                        flexibleSpace: FlexibleSpaceBar(
                          background: Image.asset(
                            'images/timg.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        bottom: TabBar(
                            tabs: _tabs
                                .map((str) => Text(
                                      str,
                                      style: TextStyle(fontSize: 18),
                                    ))
                                .toList()),
                        forceElevated: innerBoxIsScrolled,
                      ),
                    )
                  ],
              body: TabBarView(
                  // 这边需要通过 Builder 来创建 TabBarView 的内容，否则会报错
                  // NestedScrollView.sliverOverlapAbsorberHandleFor must be called with a context that contains a NestedScrollView.
                  children: _tabs
                      .map((str) => Builder(
                          builder: (context) => CustomScrollView(
                                // key 保证唯一性
                                key: PageStorageKey<String>(str),
                                slivers: <Widget>[
                                  // 将子部件同 `SliverAppBar` 重叠部分顶出来，否则会被遮挡
                                  SliverOverlapInjector(
                                      handle: NestedScrollView
                                          .sliverOverlapAbsorberHandleFor(
                                              context)),
                                  //gridview
                                  SliverGrid(
                                      delegate: SliverChildBuilderDelegate(
                                          (_, index) =>
                                              Image.asset('images/ali.jpg'),
                                          childCount: 33),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 5,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10,
                                              childAspectRatio: 1)),
                                  //listview
                                  SliverFixedExtentList(
                                      delegate: SliverChildBuilderDelegate(
                                          (_, index) => Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '$str - item${index + 1}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: colors[index % 6]),
                                                ),
                                              ),
                                          childCount: 100000),
                                      itemExtent: 50)
                                ],
                              )))
                      .toList()))),
    );
  }
}
