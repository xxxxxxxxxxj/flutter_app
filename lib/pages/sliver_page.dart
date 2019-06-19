import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {
  List<String> letters = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.pink];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('SliverPage Demo'),
            centerTitle: true,
            //展开的高度
            expandedHeight: 300,
            //强制显示阴影
            forceElevated: true,
            floating: true,
            snap: true,
            pinned: true,
            // 设置该属性，当有下滑手势的时候，就会显示 AppBar
            // floating: true,
            // 该属性只有在 floating 为 true 的情况下使用，不然会报错
            // 当上滑到一定的比例，会自动把 AppBar 收缩（不知道是不是 bug，当 AppBar 下面的部件没有被 AppBar 覆盖的时候，不会自动收缩）
            // 当下滑到一定比例，会自动把 AppBar 展开
            // snap: true,
            // 设置该属性使 Appbar 折叠后不消失
            // pinned: true,
            // 通过这个属性设置 AppBar 的背景
            flexibleSpace: FlexibleSpaceBar(
              // 背景折叠动画
              collapseMode: CollapseMode.parallax,
              background: Image.asset(
                'images/timg.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 这个部件一般用于最后填充用的，会占有一个屏幕的高度，
          // 可以在 child 属性加入需要展示的部件
          /*SliverFillRemaining(
            child: Center(
              child: Text(
                'FillRemaining',
                style: TextStyle(fontSize: 40),
              ),
            ),
          )*/
          //将SliverFillRemaining换成SliverFixedExtentList试试
          /*SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            letters[index] * 10,
                            style:
                                TextStyle(color: colors[index % colors.length]),
                          ),
                        ),
                      ),
                  childCount: letters.length),
              itemExtent: 50)*/
          /*SliverFixedExtentList(
              delegate: SliverChildListDelegate(List.generate(
                  letters.length,
                  (index) => InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            letters[index] * 10,
                            style:
                                TextStyle(color: colors[index % colors.length]),
                          ),
                        ),
                      ))),
              itemExtent: 50)*/
          //SliverFillViewport测试
          //如果一个滑动列表，每个 item 需要占满一个屏幕或者更大，可以使用该部件生成列表，但是如果 item 的高度小于一个屏幕高度，
          // 那就不太推荐了，在首尾会用空白 item 来把未填满的补上，就是首尾都会留空白。我们使用 SliverFillViewport 对
          // SliverFillRemaning 进行替换
          SliverFillViewport(
              viewportFraction: 1, //同屏幕的比例值，1.0 为一个屏幕大小
              delegate: SliverChildBuilderDelegate(
                  (_, index) => Container(
                        alignment: Alignment.center,
                        child: Text(
                          letters[index] * 10,
                          style: TextStyle(
                              fontSize: 50,
                              color: colors[index % colors.length]),
                        ),
                      ),
                  childCount: letters.length))
        ],
      ),
    );
  }
}
