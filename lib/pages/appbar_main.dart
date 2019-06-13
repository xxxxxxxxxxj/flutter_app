import 'package:flutter/material.dart';
import 'package:flutter_app/custom_routes.dart';
import 'package:flutter_app/pages/checkbox_swicth_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/pages/layout_page.dart';

class TabChangePage extends StatelessWidget {
  // 需要传入的参数
  final String content;
  final String _assetPicUrl = 'images/add_dog_phone.png';
  final String _netPicUrl =
      'http://192.168.0.252/static/avatar/1440747789538_1235.png';

  TabChangePage({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 仅展示传入的内容
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            '哈哈哈哈哈哈哈哈哈',
            maxLines: 4,
            overflow: TextOverflow.values.first,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 14,
              letterSpacing: 2,
              backgroundColor: Colors.amber,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.double,
            ),
          ),
          Text(
            content,
            style: Theme.of(context).textTheme.display1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage(_assetPicUrl),
                  width: 30,
                  height: 30,
                  fit: BoxFit.fill,
                  repeat: ImageRepeat.repeat),
              Image.asset(_assetPicUrl,
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.noRepeat),
              Image.asset(_assetPicUrl,
                  width: 30,
                  height: 30,
                  color: Colors.lightBlueAccent,
                  colorBlendMode: BlendMode.colorDodge),
              FadeInImage.assetNetwork(
                  placeholder: _assetPicUrl,
                  image: _netPicUrl,
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain),
              Icon(Icons.ac_unit,
                  size: 30, color: Theme.of(context).primaryColorDark),
            ],
          ),
          Image.network(_netPicUrl,
              height: 30,
              repeat: ImageRepeat.repeatX,
              width: MediaQuery.of(context).size.width),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: null,
                child: Text('RaisedButton Disable'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, ScalePageRoute(CheckSwitchPage()));
                },
                child: Text('RaisedButton Enable'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(onPressed: null, child: Text('FlatButton Disable')),
              FlatButton(
                  onPressed: () => Navigator.push(context, FadeInPageRoute(LayoutPage())),
                  child: Text('FlatButton Enable')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                onPressed: null,
                child: Text('MaterialButton Disable'),
              ),
              MaterialButton(
                onPressed: () {
                  print('点击MaterialButton');
                },
                child: Text('MaterialButton Enable'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                onPressed: null,
                child: Text('OutlineButton Disable'),
              ),
              OutlineButton(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                onPressed: () {},
                child: Text('OutlineButton Enable'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}