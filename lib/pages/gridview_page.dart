import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
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
      appBar: AppBar(
        title: Text('GridViewPage'),
      ),
      //GridView 需要一个 gridDelegate，gridDelegate 目前有两种
      //SliverGridDelegateWithFixedCrossAxisCount 看命名就知道，值固定数量的，这个数量是只单排的数量
      //SliverGridDelegateWithMaxCrossAxisExtent 这个是设置最大宽度/高度，在这个值范围内取最大值，比如一排能给你排下 6 个，但是远不到设置的最大值，它绝不给你排 6 个
      /*body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, //单行的个数
            mainAxisSpacing: 10, // 同 scrollDirection 挂钩，item 之间在主轴方向的间隔
            crossAxisSpacing: 10, // item 之间在副轴方法的间隔
            childAspectRatio: 1 // item 的宽高比
            ),
        // 需要根据 index 设置不同背景色，所以使用 List.generate，如果不设置背景色，也可用 iterable.map().toList
        children: List.generate(
            letters.length,
            (index) => Container(
                  alignment: Alignment.center,
                  color: colors[index % 4],
                  child: Text(letters[index]),
                )),
      ),*/
      //接下来换一种 delegate 试试效果，当然这个最大值可以根据个人喜好来设置
      /*body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            // 通过设置 `maxCrossAxisExtent` 来指定最大的宽度，在这个值范围内，会选取相对较大的值
            maxCrossAxisExtent: 50,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1),
        children: List.generate(
            letters.length,
            (index) => Container(
                  child: Text(letters[index]),
                  alignment: Alignment.center,
                  color: colors[index % 4],
                )),
      ),*/
      //为了方便写法呢，Flutter 对以上的两种方式进行了封装，省略了 delegate
      //GridView.count/GridView.extent
      //直接看下如何修改
      // 这种情况简化了 `GridView` 使用 `SliverGridDelegateWithFixedCrossAxisCount` 代理的方法
      /*body: GridView.count(
        crossAxisCount: 5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
        children: List.generate(
            letters.length,
            (index) => Container(
                  alignment: Alignment.center,
                  child: Text(letters[index]),
                  color: colors[index % 4],
                )),
      ),*/
      // 这种情况简化了 `GridView` 使用 `SliverGridDelegateWithMaxCrossAxisExtent` 代理的方法
      /*body: GridView.extent(
        maxCrossAxisExtent: 50,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
        children: List.generate(
            letters.length,
            (index) => Container(
                  alignment: Alignment.center,
                  color: colors[index % 4],
                  child: Text(letters[index]),
                )),
      ),*/
      //GridView.custom
      //这种生成方式，比 GridView 多了一个 childrenDelegate，childrenDelegate 主要分为两种，
      // 一种是通过 IndexedWidgetBuilder 来构建 item 的 SliverChildBuilderDelegate，
      // 还有一种是通过 List 来构建 item 的 SliverChildListDelegate，所以...这边直接有 4 中生成方式，当然，
      // 我们只需要了解 childrenDelegate 如何使用即可
      /*body: GridView.custom(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1),
        childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => Container(
                  alignment: Alignment.center,
                  color: colors[index % 4],
                  child: Text(letters[index]),
                ),
            childCount: letters.length),
      ),*/
      /*body: GridView.custom(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 50,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1),
          childrenDelegate: SliverChildListDelegate(List.generate(
              letters.length,
              (index) => Container(
                    alignment: Alignment.center,
                    color: colors[index % 4],
                    child: Text(letters[index]),
                  )))),*/
      //GridView.builder
      //前面介绍的方法中，生成 item 的方式基本上是通过 List 进行转换的，在 custom 提到了 IndexWidgetBuilder 的生成方式，
      // 当然，在 ListView 的时候也用到了这种生成方式，当然 GridView 也有啊，要「雨露均沾」你说是吧
      body: GridView.builder(
          itemCount: letters.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1),
          itemBuilder: (context, index) => Container(
                alignment: Alignment.center,
                color: colors[index % 4],
                child: Text(letters[index]),
              )),
    );
  }
}
