import 'package:flutter/material.dart';

class NavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '路由练习',
      debugShowCheckedModeBanner: false,
      // 在这里注册路由，关联 name 和界面
      // '/' 表示根页面，也就是 home 所对应的页面，这边就不需要配置 home 属性了
      routes: {
        '/': (_) => APage(),
        '/page_b': (_) => BPage(),
        '/page_c': (_) => CPage()
      },
    );
  }
}

class APage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APage'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //跳转后，可以发现，在 BPage 的 AppBar 上有个返回按钮，点击可以返回 APage ，那么也就是说通过 push 或者 pushNamed 方式跳转的时候，界面堆栈的变化是直接在原来的堆栈上添加一个新的 page
            //不带name的路由跳转，无需注册
            //需要传递参数的话，之前在 MaterialApp 下注册的路由就需要去除了。
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BPage(
                              message: 'Message From Page A',
                            )))
                .then((onValue) => debugPrint('BACK MESSAGE => $onValue'));
            //带name的路由跳转，需要注册，用name来跳转
            //Navigator.pushNamed(context, '/page_b');
            //pushReplacement / pushReplacementNamed / popAndPushNamed
            //将 APage 中的跳转方式进行替换
            /*Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => BPage()));*/
            //Navigator.pushReplacementNamed(context, '/page_b');
            /*如果是第一个界面跳转到下个界面，勿用，`BPage` 会显示返回按钮，但是点击后，界面会变黑
            // 因为 `APage` 已经不在堆栈中了，点击后堆栈就没有 `Page` 了，所以界面变黑*/
            //Navigator.popAndPushNamed(context, '/page_b');
          },
          child: Text('To Page B'),
        ),
      ),
    );
  }
}

class BPage extends StatelessWidget {
  String message;

  BPage({Key key, @required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message),
            RaisedButton(
              onPressed: () {
                //pushAndRemoveUntil / pushNamedAndRemoveUntil
                //清空堆栈
                /*Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => CPage()),
                    (Route route) => false);*/
                //或者
                /*Navigator.pushNamedAndRemoveUntil(
                    context, '/page_c', (Route route) => false);*/
                //该方法会把堆栈中在 ModalRoute.withName 所对应的 page 上的所有都 pop 出堆栈
                /*Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => CPage()),
                    ModalRoute.withName('/'));*/
                Navigator.pushNamedAndRemoveUntil(
                    context, '/page_c', ModalRoute.withName('/'));
              },
              child: Text('To Page C'),
            ),
            RaisedButton(
              onPressed: () {
                //结束当前页面
                Navigator.pop(context, 'Message back to PageA From BPage');
              },
              child: Text('To Page A'),
            ),
          ],
        ),
      ),
    );
  }
}

class CPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('CPage'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  //点击返回按钮，界面跳过 BPage 回到了 APage，解释同 pushAndRemoveUntil 那么堆栈的变化也显而易见咯
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Text('Back Last Page'),
              )
            ],
          ),
        ),
      ),
      onWillPop: () async {
        //监听返回键
        Navigator.pop(context, 'Hello BPage');
      },
    );
  }
}
