import 'package:flutter/material.dart';

class CustomScrollViewPage extends StatelessWidget {
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
        title: Text('CustomScrollViewPage Demo'),
      ),
      body: CustomScrollView(
        // 这里需要传入 `Sliver` 部件
        slivers: <Widget>[
          // SliverGrid 实现同 GridView 实现方式一样
          // 同样 SliverGrid 有提供 `count`, `entent` 方法便于快速生成 SliverGrid
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (_, index) => InkWell(
                        onTap: () {},
                        child: Image.asset('images/ali.jpg'),
                      ),
                  childCount: letters.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1)),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: <Widget>[
                  Divider(
                    height: 1,
                    color: Colors.deepPurple,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/app_bar_hor.jpg',
                        fit: BoxFit.cover,
                      ),
                      Text(
                        '我是一些别的东西..例如广告',
                        textScaleFactor: 1,
                        style: TextStyle(fontSize: 10, color: Colors.redAccent),
                      )
                    ],
                  ),
                  Divider(
                    height: 2,
                    color: Colors.yellow,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
          ),
          // SliverFixedExtentList 实现同 List.custom 实现类似
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            letters[index] * 10,
                            style: TextStyle(
                                color: colors[index % colors.length]),
                          ),
                        ),
                      ),
                  childCount: letters.length),
              itemExtent: 50)
        ],
      ),
    );
  }
}
