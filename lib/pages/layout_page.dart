import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      //样式
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red,
        backgroundBlendMode: BlendMode.colorDodge,
        image: DecorationImage(
          image: AssetImage('images/ali.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        //竖向线性布局
        children: <Widget>[
          Text(
            'Container Text',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          // 需要传入一个间隔值，`Flutter` 提供了很多 EdgeInsets 来设置间隔，
          // 参数也很明确，可以一一尝试
          Padding(
            // 需要传入一个间隔值，`Flutter` 提供了很多 EdgeInsets 来设置间隔，
            // 参数也很明确，可以一一尝试
            padding: const EdgeInsets.symmetric(vertical: 20),
            // 传入需要间隔的部件
            child: Text('Container Text1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
          ),
          Wrap(
            children: <Widget>[
              Text('Container Text2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
              Text('Container Text3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
              Text('Container Text4',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
              Text('Container Text5',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
              Text('Container Text6',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ],
          ),
          //堆叠控件
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CircleAvatar(
                // 圆形头像，指定半径，指定背景图为头像即可
                backgroundImage: AssetImage('images/ali.jpg'),
                radius: 50,
              ),
              Text(
                'kele',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              Positioned(
                child: Text(
                  '另外一段文字',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                bottom: 10,
              )
            ],
          ),
          /*Column(
            children: <Widget>[
              Expanded(
                  //等分的部件 Expanded
                  flex: 1, // 所占比例
                  child: Text('Container Text7',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ))),
              Expanded(
                  //等分的部件 Expanded
                  flex: 2, // 所占比例
                  child: Text('Container Text8',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )))
            ],
          ),*/
        ],
      ),
    ));
  }
}
