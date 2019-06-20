import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/appbar_main.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      var systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '第一个flutter项目'),
      supportedLocales: const [const Locale('zh')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  List<String> _abs = ['A', 'B', 'C', 'D'];
  TabController _tabController;
  PageController _pageController; //用于跟TabController联动

  void _incrementCounter() {
    setState(() {
      _counter++;
      print('啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦' + '$_counter');
    });
  }

  @override
  void initState() {
    super.initState();
    //初始化_tabController
    // 引入 `SingleTickerProviderStateMixin` 类主要是因为 _tabController 需要传入 vsync 参数
    _tabController = TabController(length: _abs.length, vsync: this);
    _pageController = PageController(initialPage: 0);
    _tabController.addListener(() {
      // 判断 TabBar 是否切换位置了，如果切换了，则修改 PageView 的显示
      if (_tabController.indexIsChanging) {
        // PageView 的切换通过 controller 进行滚动
        // duration 表示切换滚动的时长，curve 表示滚动动画的样式，
        // flutter 已经在 Curves 中定义许多样式，可以自行切换查看效果
        _pageController.animateToPage(_tabController.index,
            duration: Duration(microseconds: 300), curve: Curves.decelerate);
      }
    });
  }

  @override
  void dispose() {
    // 需要在界面 dispose 之前把 _tabController dispose，防止内存泄漏
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          isScrollable: false,
          indicatorColor: Colors.red,
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 1,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.white,
          tabs: List.generate(
              _abs.length,
              (index) => Tab(
                    text: _abs[index],
                    icon: Icon(Icons.android),
                  )),
        ),
        /*flexibleSpace: Image.asset(
          'images/app_bar_hor.jpg',
          fit: BoxFit.cover,
        ),*/
        //automaticallyImplyLeading: false,
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
              offset: Offset(50, 100),
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onSelected: (val) => debugPrint('Selected item is $val'),
              itemBuilder: (context) => List.generate(
                  _abs.length,
                  (index) => PopupMenuItem(
                        value: _abs[index],
                        child: Text(_abs[index]),
                      ))),
          /*FlatButton(
              onPressed: () {
                print('菜单按钮被点击');
              },
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              ))*/
        ],
        /*leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () => debugPrint('点击返回按钮'),
        ),*/
        title: Text(widget.title, textAlign: TextAlign.center, maxLines: 1),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (position) {
          // PageView 切换的监听，这边切换 PageView 的页面后，TabBar 也需要随之改变
          // 通过 tabController 来改变 TabBar 的显示位置
          _tabController.index = position;
        },
        children: _abs
            .map((str) => TabChangePage(content: str))
            .toList(), // 通过 Map 转换后再通过 toList 转换成列表，效果同 List.generate
      ),
      drawer: Drawer(
        // 记得要先添加 `SafeArea` 防止视图顶到状态栏下面
        child: SafeArea(
            child: Container(
          child: Text(
            'Drawer',
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 30),
          ),
        )),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.android,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.people,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {})
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
