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
  var _fiveLevelData = [
    [
      [
        ['A0', 'A1', 'A2', 'A3'],
        ['B0', 'B1', 'B2', 'B3']
      ],
      [
        ['C0', 'C1', 'C2', 'A3'],
        ['D0', 'D1', 'D2', 'D3']
      ]
    ],
    [
      [
        ['A0', 'A1', 'A2', 'A3'],
        ['B0', 'B1', 'B2', 'B3']
      ],
      [
        ['C0', 'C1', 'C2', 'A3'],
        ['D0', 'D1', 'D2', 'D3']
      ]
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('折叠列表ExpansionTile'),
      ),
      /*body: SingleChildScrollView(
          child: ExpansionTile(
            title: Text(
              '父亲',
              style: TextStyle(fontSize: 20),
            ),
            // 最前面的 widget
            leading: Icon(Icons.phone_iphone),
            //替换默认箭头
            trailing: Icon(Icons.phone_android),
            //默认是否展开
            initiallyExpanded: true,
            //展开时的背景色
            backgroundColor: Colors.yellow[100],
            //展开或收起的回调
            onExpansionChanged: (isOpen) {
              print('当前状态为：$isOpen' == true ? '展开' : '收起');
            },
            children: List.generate(
                11,
                (index) => Container(
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 80),
                        child: Text(
                          '儿子：$index',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    )),
          ),
        )
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
      ),*/
      //五层折叠列表,配合SingleChildScrollView使用，不然会显示不全
      body: SingleChildScrollView(
        child: ExpansionTile(
          title: Text("父亲1"),
          children: _fiveLevelData
              .map((_forthLevelData) => ExpansionTile(
                    title: Text('父亲2'),
                    children: _forthLevelData
                        .map((_threeLevelData) => ExpansionTile(
                              title: Text("父亲3"),
                              children: _threeLevelData
                                  .map((_twoLevelData) => ExpansionTile(
                                        title: Text('父亲4'),
                                        children: _twoLevelData
                                            .map((str) => Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: 50,
                                                  padding:
                                                      EdgeInsets.only(left: 50),
                                                  child: Text(str),
                                                ))
                                            .toList(),
                                      ))
                                  .toList(),
                            ))
                        .toList(),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
