import 'package:flutter/material.dart';

class LoginPageTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageTestState();
  }
}

class _LoginPageTestState extends State<LoginPageTest> {
  // 可以传入初始值
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  // 监听输入内容变化的内容值
  String _spyContent = '';

  // 保存按钮点击后的输入内容值
  String _content = '';

  @override
  void initState() {
    super.initState();
    // 当输入框获取到焦点或者失去焦点的时候回调用
    _textEditingController.addListener(() {
      print('edit has focus? => ${_focusNode.hasFocus}');
    });
  }

  @override
  void dispose() {
    // 记得销毁，防止内存溢出
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _textEditingController,
              focusNode: _focusNode,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.phone_iphone,
                    color: Theme.of(context).primaryColor,
                  ),
                  labelText: '请输入手机号',
                  helperText: '手机号',
                  hintText: '手机号...在这儿输入呢'),
              // 输入类型为数字类型
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              style: TextStyle(color: Colors.redAccent, fontSize: 18),
              textDirection: TextDirection.ltr,
              maxLength: 11,
              // 最大长度为 11
              maxLengthEnforced: true,
              // 超过长度的不显示
              onChanged: (str) {
                // 输入的内容发生改变会调用
                setState(() {
                  _spyContent = str;
                });
              },
              onSubmitted: (str) {
                setState(() {
                  _content = str;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: RaisedButton(
                onPressed: () {
                  // 获取输入的内容
                  setState(() {
                    _content = _textEditingController.value.text;
                  });
                  // 清理输入内容
                  _textEditingController.clear();
                  setState(() {
                    _spyContent = '';
                  });
                },
                child: Text('获取输入内容'),
              ),
            ),
            // 展示输入的内容，点击按钮会显示
            Text(_content.isNotEmpty ? '获取到输入内容:$_content' : '还未获取到任何内容...'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              // 监听输入内容的变化，会跟随输入的内容进行改变
              child: Text('我是文字内容监听$_spyContent'),
            )
          ],
        ),
      ),
    );
  }
}
