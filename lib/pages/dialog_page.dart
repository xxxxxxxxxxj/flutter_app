import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DialogPageState();
  }
}

class _DialogPageState extends State<DialogPage> {
  int _count = 0;
  var _genders = ['男', '女'];
  var _colors = [Colors.redAccent, Colors.yellow, Colors.deepPurple];

  //自增操作
  increase() {
    setState(() => _count++);
  }

  //自减操作
  decrease() {
    setState(() => _count--);
  }

  _changeValue(BuildContext context) {
    increase();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('当前值已修改'),
      action: SnackBarAction(label: '撤销', onPressed: () => decrease()),
      duration: Duration(milliseconds: 2000),
    ));
  }

  //可以看到 showBottomSheet 会充满整个屏幕，然后 fab 会跟随一起到 AppBar 的底部位置，而 showModalBottomSheet
  // 展示的高度不会超过半个屏幕的高度，但是 fab 被其遮挡了。假如我们只需要展示 2-3 个 item，但是按照刚才的方式 showModalBottomSheet
  // 的高度太高了，那我们可以在 ListView 外层包裹一层 Container，然后指定 height 即可
  _showBottomSheet(BuildContext context) {
    var _colors = [Colors.redAccent, Colors.yellow, Colors.deepPurple];
    showBottomSheet(
        context: context,
        builder: (context) => ListView(
              // 生成一个列表选择器
              children: List.generate(
                  20,
                  (index) => InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          child: Text(
                            'item$index',
                            style: TextStyle(
                                fontSize: 20, color: _colors[index % 3]),
                          ),
                        ),
                      )),
            ));
  }

  //可以看到 showBottomSheet 会充满整个屏幕，然后 fab 会跟随一起到 AppBar 的底部位置，而 showModalBottomSheet
  // 展示的高度不会超过半个屏幕的高度，但是 fab 被其遮挡了。假如我们只需要展示 2-3 个 item，但是按照刚才的方式 showModalBottomSheet
  // 的高度太高了，那我们可以在 ListView 外层包裹一层 Container，然后指定 height 即可
  _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              alignment: Alignment.center,
              height: 90,
              child: ListView(
                children: List.generate(
                    3,
                    (index) => Container(
                          alignment: Alignment.center,
                          height: 30,
                          child: Text(
                            'item${index}',
                            style: TextStyle(
                                fontSize: 15, color: _colors[index % 3]),
                          ),
                        )),
              ),
            ));
  }

  //相对于 SnackBar 和 BottomSheet，Dialog 的使用场景相对会更多，在 MaterialDesign 下，Dialog 主要有 3 种：
  // AlertDialog，SimpleDialog 和 AboutDialog，当然在 Cupertino 风格下也有相应的 Dialog，因为这个系列以 MaterialDesign
  // 风格为主，所以 Cupertiono 等下次有时间再写吧。
  _showAlertDialog() {
    showDialog(
        context: context,
        barrierDismissible: false, //设置点击dialog外部不消失
        builder: (context) => AlertDialog(
              title: Text('我是个标题...嗯，标题..'),
              titlePadding: EdgeInsets.only(bottom: 10),
              titleTextStyle: TextStyle(fontSize: 18, color: Colors.brown),
              //标题文字样式
              content: Text(r'我是内容\(^o^)/~, 我是内容\(^o^)/~, 我是内容\(^o^)/~'),
              contentTextStyle:
                  TextStyle(fontSize: 20, color: Colors.lightBlue),
              contentPadding: EdgeInsets.only(bottom: 10),
              backgroundColor: CupertinoColors.white,
              elevation: 8,
              //投影的阴影高度
              semanticLabel: 'Label',
              // 这个用于无障碍下弹出 dialog 的提示
              shape: Border.all(),
              // dialog 的操作按钮，actions 的个数尽量控制不要过多，否则会溢出 `Overflow`
              actions: <Widget>[
                FlatButton(onPressed: increase, child: Text('点我自增')),
                FlatButton(onPressed: decrease, child: Text('点我自减')),
                FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('点我关闭'))
              ],
            ));
  }

  //SimpleDialog 相比于 AlertDialog 少了 content 和 action 参数，多了 children 属性，需要传入 Widget 列表，
  // 那就可以自定义全部内容了。那我们这里就实现一个性别选择的 Dialog，选择后通过 Taost 提示选择的内容，Taost 就是之前导入的第三方插件
  _showSimpleDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => SimpleDialog(
              title: Text('我是个比较正经的标题...\n选择你的性别'),
              children: _genders
                  .map((sex) => InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Fluttertoast.showToast(msg: "你选择的性别是$sex");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          child: Text(sex),
                        ),
                      ))
                  .toList(),
            ));
  }

//AboutDialog 主要是用于展示你的 App 或者别的相关东西的内容信息的，平时用的比较少，显示 AboutDialog 有两种方式可以展示，
// 一种是前面一样的 showDialog 方法，传入一个 AboutDialog 实例，还有中方法是直接调用 showAboutDialog 方法。
// 我们还是一样在列表加个按钮，并指向显示 AboutDialog 的事件。
  _showAboutDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AboutDialog(
              //app的名字
              applicationName: 'Flutter 入门指北',
              // App 的版本号
              applicationVersion: '0.1.1',
              // App 的图标
              applicationIcon: Icon(
                Icons.android,
                size: 28,
                color: CupertinoColors.activeBlue,
              ),
              // App 基本信息下面会显示一行小字，主要用来显示版权信息
              applicationLegalese:
                  'Copyright: this is a copyright notice topically',
              children: <Widget>[
                Text('我是个比较正经的对话框内容...你可以随便把我替换成任何部件，只要你喜欢(*^▽^*)')
              ],
            ));
  }

  _showAboutDialog1() {
    showAboutDialog(
      context: context,
      //app的名字
      applicationName: 'Flutter 入门指北',
      // App 的版本号
      applicationVersion: '0.1.1',
      // App 的图标
      applicationIcon: Image.asset(
        'images/app_icon.png',
        width: 40,
        height: 40,
      ),
      // App 基本信息下面会显示一行小字，主要用来显示版权信息
      applicationLegalese: 'Copyright: this is a copyright notice topically',
      children: <Widget>[Text('我是个比较正经的对话框内容...你可以随便把我替换成任何部件，只要你喜欢(*^▽^*)')],
    );
  }

  _showDialogState() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => StatefulBuilder(
            builder: (context, dialogSetState) => SimpleDialog(
                  title: Text('我这边能实时修改状态值'),
                  children: <Widget>[
                    Text('当前值是:$_count'),
                    Row(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () => dialogSetState(() => increase()),
                          child: Text('点我自增'),
                        ),
                        RaisedButton(
                          onPressed: () => dialogSetState(() => decrease()),
                          child: Text('点我自减'),
                        ),
                        RaisedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('点我关闭'),
                        )
                      ],
                    )
                  ],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DialogPage Demo'),
      ),
      body: Column(
        children: <Widget>[
          Text(
            '当前值：$_count',
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
              // 为了方便拓展，我这边提取了 `snackBar` 的方法，并把按钮放在列表
              child: ListView(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            children: <Widget>[
              // SnackBar 需要提供一个包含 context，但是 context 不能是 Scaffold 节点下的 context，所以需要通过 Builder 包裹一层
              Builder(
                  builder: (context) => RaisedButton(
                        onPressed: () => _changeValue(context),
                        child: Text('修改当前值'),
                      )),
              //BottomSheet 看命名就知道是从底部弹出的菜单，展示 BottomSheet 有两种方式，分别是 showBottomSheet 和 showModalBottomSheet，
              // 两种方式只有在展示类型上的差别，方法调用无差，而且 showBottomSheet 和 fab 有组合动画，showModalBottomSheet 则没有，
              // 看下实际的例子吧。在 ListView 中增加一个 BottomSheet 的按钮，因为 BottomSheet 需要的 context 也不能是 Scaffold 下的
              // context，所以需要通过 Builder 进行包裹一层，然后增加 _showBottomSheet 的方法
              Builder(
                  builder: (context) => RaisedButton(
                        onPressed: () => _showBottomSheet(context),
                        child: Text('BottomSheet'),
                      )),
              Builder(
                  builder: (context) => RaisedButton(
                        onPressed: () => _showModalBottomSheet(context),
                        child: Text('ModalBottomSheet'),
                      )),
              RaisedButton(
                onPressed: () => _showAlertDialog(),
                child: Text('AlertDialog'),
              ),
              RaisedButton(
                onPressed: () => _showSimpleDialog(),
                child: Text('SimpleDialog'),
              ),
              RaisedButton(
                onPressed: () => _showAboutDialog1(),
                child: Text('AboutDialog'),
              ),
              RaisedButton(
                onPressed: () => _showDialogState(),
                child: Text('DialogState'),
              ),
            ],
          ))
        ],
      ),
      // 当 SnackBar 弹出时，fab 会上移一段距离
      floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
                onPressed: () => _changeValue(context),
                child: Icon(Icons.send),
              )),
    );
  }
}
