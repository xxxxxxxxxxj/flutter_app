import 'package:flutter/material.dart';

/**
 * 实现 ListView 的方法主要有
    通过 ListView 设置 children 属性实现
    通过 ListView.custom 实现
    通过 ListView.builder 实现
    通过 ListView.separated 实现带分割线列表
 */
class ListViewPage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewPage'),
      ),
      //方法1
      /*body: ListView(
        // 通过修改滑动方向设置水平或者垂直方向滚动
        scrollDirection: Axis.vertical,
        // 通过 iterable.map().toList 和 List.generate 方法效果是一样的
        children: letters
            .map((str) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Center(child: Text(str),),
                ))
            .toList(),
      ),*/
      //方法2
      /*body: ListView.custom(
          // 指定 item 的高度，可以加快渲染的速度
          itemExtent: 50,
          // item 代理
          // IndexedWidgetBuilder，根据 index 设置 item 中需要变化的数据
          childrenDelegate: SliverChildBuilderDelegate(
              (_, index) => Center(
                    child: Text(
                      letters[index],
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.pink,
                          backgroundColor: Colors.deepPurple,),
                    ),
                  ),
              childCount: letters.length)),*/
      //方法3
      /*body: ListView.builder(
          itemExtent: 50,
          itemCount: letters.length,
          itemBuilder: (context, index) => Center(
                child: Text(
                  letters[index],
                  style: TextStyle(fontSize: 18, color: Colors.pink),
                ),
              )),*/
      //方法4
      //如果需要在每个 item 之间添加分割线，那么通过以上的方式实现就比较困难了，所以 Flutter 提供了 separated 方法用来快速构建带有分割线的 ListView
      //加入我们的 item 之间的分割线需要如下样式：奇数位和偶数位之间用黑色分割线，偶数位和奇数位之间用红色分割线
      body: ListView.separated(
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    letters[index],
                    style: TextStyle(fontSize: 18, color: Colors.pink),
                  ),
                ),
              ),
          // 这里用来定义分割线
          separatorBuilder: (_, index) => Divider(
                height: 0.5,
                color: index % 2 == 0 ? Colors.black : Colors.blue,
              ),
          itemCount: letters.length),
      //总结下：如果 item 的高度能够准确获取，一定要指定 itemExtent 的值，这样会更加高效
    );
  }
}
