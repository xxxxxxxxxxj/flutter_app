import 'package:flutter/material.dart';

class ExpansionTilePage extends StatelessWidget {
  final _keys = [
    'ParentA',
    'ParentB',
    'ParentC',
    'ParentD',
    'ParentE',
    'ParentF'
  ];
  final Map<String, List<String>> _data = {
    'ParentA': [
      'Child A0',
      'Child A1',
      'Child A2',
      'Child A3',
      'Child A4',
      'Child A5'
    ],
    'ParentB': [
      'Child B0',
      'Child B1',
      'Child B2',
      'Child B3',
      'Child B4',
      'Child B5'
    ],
    'ParentC': [
      'Child C0',
      'Child C1',
      'Child C2',
      'Child C3',
      'Child C4',
      'Child C5'
    ],
    'ParentD': [
      'Child D0',
      'Child D1',
      'Child D2',
      'Child D3',
      'Child D4',
      'Child D5'
    ],
    'ParentE': [
      'Child E0',
      'Child E1',
      'Child E2',
      'Child E3',
      'Child E4',
      'Child E5'
    ],
    'ParentF': [
      'Child F0',
      'Child F1',
      'Child F2',
      'Child F3',
      'Child F4',
      'Child F5'
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('折叠列表ExpansionTile'),
      ),
      /*body: ExpansionTile(
        title: Text('父亲'),
        // 最前面的 widget
        leading: Icon(Icons.phone_iphone),
        //替换默认箭头
        trailing: Icon(Icons.phone_android),
        //默认是否展开
        initiallyExpanded: true,
        //展开时的背景色
        backgroundColor: Colors.blue,
        //展开或收起的回调
        onExpansionChanged: (isOpen) {
          print('当前状态为：$isOpen' == true ? '展开' : '收起');
        },
        children: List.generate(11, (index) {
          Container(
            height: 50,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 80),
              child: Text(
                '儿子：$index',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          );
        }),
      ),*/
      body: ListView(
        children: _keys
            .map((key) => ExpansionTile(
                  title: Text(key),
                  children: _data[key]
                      .map((value) => InkWell(
                            child: Container(
                              child: Text(value),
                              padding: EdgeInsets.only(left: 80),
                              height: 50,
                              alignment: Alignment.centerLeft,
                            ),
                            onTap: () {},
                          ))
                      .toList(),
                ))
            .toList(),
      ),
    );
  }
}
