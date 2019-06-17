import 'package:flutter/material.dart';
import 'package:flutter_app/utils/third_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrAndLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrAndLoginPageState();
  }
}

class _RegistrAndLoginPageState extends State<RegistrAndLoginPage>
    with SingleTickerProviderStateMixin {
  List<String> _titleList = ['登录', '注册'];
  TabController _tabController;
  List<Widget> _pages = [];
  int _position = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _titleList.length, vsync: this);
    _pages..add(LoginPage())..add(RegistrPage());
    // 当 tab 切换的时候，联动 IndexStack 的 child 页面也进行修改，通过 setState 来修改值
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _position = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            primarySwatch: Colors.pink,
            iconTheme: IconThemeData(color: Colors.pink)),
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            //剧中显示
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/login_bg.png'),
                    fit: BoxFit.cover)),
            // 先忽略...下面会讲，主要是解决软键盘弹出的时候，界面内容会溢出的问题
            child: SingleChildScrollView(
              child: SafeArea(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //顶部页面指示器
                  TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      //指示器与字同宽
                      controller: _tabController,
                      indicatorWeight: 3,
                      indicatorColor: Colors.white,
                      // 返回 tab 列表
                      tabs: _titleList
                          .map((str) => Text(
                                str,
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ))
                          .toList()),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: SizedBox(
                      // 切换界面列表
                      child: IndexedStack(
                        children: _pages,
                        index: _position,
                      ),
                    ),
                  )
                ],
              )),
            ),
          ),
        ));
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  //用于判断表单内容是否有效
  GlobalKey<FormState> _fromKey = GlobalKey();

  //用于获取表单内容
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    //防止内存溢出，销毁
    _userNameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _fromKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: TextFormField(
                controller: _userNameController,
                style: TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                    icon: Icon(
                      ThirdIcons.username,
                      size: 24,
                      color: Colors.white,
                    ),
                    labelText: "请输入用户名",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    helperText: '输入用户名哦',
                    hintText: '请输入用户名哦',
                    hintStyle: TextStyle(color: Colors.white),
                    helperStyle: TextStyle(color: Colors.white)),
                // 有效条件(为空不通过，返回提示语，通过返回 null)
                validator: (value) =>
                    value.trim().isNotEmpty ? null : '用户名不能为空哦',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: TextFormField(
                obscureText: true,
                //是否是密码
                controller: _passwordController,
                style: TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                  icon: Icon(
                    ThirdIcons.password,
                    size: 24,
                    color: Colors.white,
                  ),
                  labelText: "请输入密码",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  helperText: '输入密码哦',
                  hintText: '请输入密码哦',
                  hintStyle: TextStyle(color: Colors.white),
                  helperStyle: TextStyle(color: Colors.white),
                ),
                validator: (value) =>
                    value.trim().length < 6 ? '密码长度不能小于6位' : null,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: _Login,
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Text(
                    '登录',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  _Login() {
    //取消焦点
    FocusScope.of(context).requestFocus(FocusNode());
    //判断表单是否有效
    if (_fromKey.currentState.validate()) {
      //获取输入框内容
      var username = _userNameController.value.text;
      var password = _passwordController.value.text;
      //判断登录条件
      if (username == '小可乐' && password == '20181119') {
        // 引入的三方插件方法，`Flutter` 没有自带的 `Taost`
        Fluttertoast.showToast(msg: '登录成功');
      } else {
        Fluttertoast.showToast(msg: '登录失败');
      }
    }
  }
}

class RegistrPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrPageState();
  }
}

class _RegistrPageState extends State<RegistrPage> {
  //用于获取表单内容
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: TextFormField(
            controller: _userNameController,
            style: TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
                icon: Icon(
                  ThirdIcons.username,
                  size: 24,
                  color: Colors.white,
                ),
                labelText: "请输入用户名",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                helperText: '输入用户名哦',
                hintText: '请输入用户名哦',
                hintStyle: TextStyle(color: Colors.white),
                helperStyle: TextStyle(color: Colors.white)),
            // 有效条件(为空不通过，返回提示语，通过返回 null)
            validator: (value) => value.trim().isNotEmpty ? null : '用户名不能为空哦',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: TextFormField(
            obscureText: true,
            //是否是密码
            controller: _passwordController,
            style: TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              icon: Icon(
                ThirdIcons.password,
                size: 24,
                color: Colors.white,
              ),
              labelText: "请输入密码",
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              helperText: '输入密码哦',
              hintText: '请输入密码哦',
              hintStyle: TextStyle(color: Colors.white),
              helperStyle: TextStyle(color: Colors.white),
            ),
            validator: (value) => value.trim().length < 6 ? '密码长度不能小于6位' : null,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: TextFormField(
            obscureText: true,
            //是否是密码
            controller: _passwordConfirmController,
            style: TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              icon: Icon(
                ThirdIcons.password,
                size: 24,
                color: Colors.white,
              ),
              labelText: "请确认密码",
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              helperText: '确认密码哦',
              hintText: '请确认密码哦',
              hintStyle: TextStyle(color: Colors.white),
              helperStyle: TextStyle(color: Colors.white),
            ),
            validator: (value) => value.trim().length < 6 ? '密码长度不能小于6位' : null,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              onPressed: _Registr,
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Text(
                '注册',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        )
      ],
    ));
  }

  _Registr() {
    var password = _passwordController.value.text;
    var passwordconfirm = _passwordConfirmController.value.text;
    if (password == passwordconfirm) {
      _passwordConfirmController.clear();
      _passwordController.clear();
      _userNameController.clear();
      Fluttertoast.showToast(msg: '注册成功');
    } else {
      Fluttertoast.showToast(msg: '注册失败，请确认密码');
      _passwordConfirmController.clear();
    }
  }
}
