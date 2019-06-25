import 'package:flutter/material.dart';
import 'package:flutter_app/custom_routes.dart';
import 'package:flutter_app/pages/checkbox_swicth_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/pages/customscrollview_page.dart';
import 'package:flutter_app/pages/dialog_page.dart';
import 'package:flutter_app/pages/expansiontile_page.dart';
import 'package:flutter_app/pages/gesture_page.dart';
import 'package:flutter_app/pages/gridview_page.dart';
import 'package:flutter_app/pages/layout_page.dart';
import 'package:flutter_app/pages/listview_page.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:flutter_app/pages/navigator_main.dart';
import 'package:flutter_app/pages/nestedscrollview_page.dart';
import 'package:flutter_app/pages/sliver_page.dart';
import 'package:flutter_app/pages/registr_and_login.dart';
import 'package:flutter_app/pages/scrollcontroller_page.dart';
import 'package:flutter_app/pages/slide_layout.dart';
import 'package:flutter_app/pages/sliverpersistentheader_page.dart';

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
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '哈哈',
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
                  onPressed: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => RegistrAndLoginPage())),
                  child: Text('注册登录界面实战'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context, ScalePageRoute(CheckSwitchPage()));
                  },
                  child: Text('复选框和开关按钮'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                    onPressed: () => Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => SlideLayoutPage())),
                    child: Text('滑动控件')),
                FlatButton(
                    onPressed: () =>
                        Navigator.push(context, FadeInPageRoute(LayoutPage())),
                    child: Text('布局搭建')),
                FlatButton(
                    onPressed: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => CustomScrollViewPage())),
                    child: Text('CustomScrollView')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => ListViewPage()));
                  },
                  child: Text('ListView'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context, RotateScalePageRoute(NavigatorPage()));
                  },
                  child: Text('路由'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context, RotateScalePageRoute(ScrollControllerPage()));
                  },
                  child: Text('ScrollController'),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => ExpansionTilePage()));
                  },
                  child: Text('折叠列表ExpansionTile'),
                ),
                OutlineButton(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  onPressed: () {
                    // CupertinoPageRoute 为 iOS 风格切换，支持侧滑关闭当前页面
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => LoginPageTest()));
                  },
                  child: Text('注册登录界面实现'),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => GridViewPage()));
                  },
                  child: Text('GridView'),
                ),
                OutlineButton(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  onPressed: () {
                    // CupertinoPageRoute 为 iOS 风格切换，支持侧滑关闭当前页面
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => SliverPage()));
                  },
                  child: Text('SliverPage'),
                ),
                OutlineButton(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  onPressed: () {
                    // CupertinoPageRoute 为 iOS 风格切换，支持侧滑关闭当前页面
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => SliverPersistentHeaderPage()));
                  },
                  child: Text('SliverHeader'),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => NestedScrollViewPage()));
                  },
                  child: Text('NestedScrollView'),
                ),
                OutlineButton(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => DialogPage()));
                  },
                  child: Text('弹窗提示'),
                ),
                OutlineButton(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => GesturePage()));
                  },
                  child: Text('Gesture'),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => NestedScrollViewPage()));
                  },
                  child: Text('NestedScrollView'),
                ),
                OutlineButton(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => DialogPage()));
                  },
                  child: Text('弹窗提示'),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => NestedScrollViewPage()));
                  },
                  child: Text('NestedScrollView'),
                ),
                OutlineButton(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => DialogPage()));
                  },
                  child: Text('弹窗提示'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
