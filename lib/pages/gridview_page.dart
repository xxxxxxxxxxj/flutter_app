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
      body: GridView(
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
      ),
    );
  }
}
