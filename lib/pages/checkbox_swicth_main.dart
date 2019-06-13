import 'package:flutter/material.dart';

class CheckSwitchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CheckSwitchPageState();
  }
}

class _CheckSwitchPageState extends State<CheckSwitchPage> {
  var _isChecked = false;
  var _isTitleCheckd = false;
  var _isOn = false;
  var _isTitleOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckSwitchPage'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Checkbox(
                // 是否开启三态
                tristate: true,
                // 控制当前 checkbox 的开启状态
                value: _isChecked,
                // 不设置该方法，处于不可用状态
                onChanged: (checked) {
                  // 管理状态值
                  setState(() {
                    _isChecked = checked;
                  });
                },
                //选中时的颜色
                activeColor: Colors.pink,
                // 这个值有 padded 和 shrinkWrap 两个值，
                // padded 时候所占有的空间比 shrinkWrap 大
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              Checkbox(
                value: _isChecked,
                onChanged: null,
                tristate: true,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Switch(
                value: _isOn,
                onChanged: (onState) {
                  setState(() {
                    _isOn = onState;
                  });
                },
                // 开启时候，那个条的颜色
                activeTrackColor: Colors.yellow,
                // 关闭时候，那个条的颜色
                inactiveTrackColor: Colors.yellow[500],
                // 设置指示器的图片，当然也有 color 可以设置
                activeThumbImage: AssetImage('images/ali.jpg'),
                inactiveThumbImage: AssetImage('images/ali.jpg'),
                // 开始时候的颜色，貌似会被 activeTrackColor 顶掉
                activeColor: Colors.pink,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              Switch(value: _isOn, onChanged: null),
            ],
          ),
          CheckboxListTile(
              // 和 checkbox 对立边的部件，例如 checkbox 在头部，则 secondary 在尾部
              secondary: Image.asset(
                'images/ali.jpg',
                width: 30,
                height: 30,
              ),
              // title 和 subtitle 是否为垂直密集列表中一员，最明显就是部件会变小
              dense: true,
              // 描述选项
              title: Text('Make this item checked'),
              // 二级描述
              subtitle: Text(
                  'description...description...\ndescription...description...'),
              value: _isTitleCheckd,
              // 是否需要使用 3 行的高度，该值为 true 时候，subtitle 不可为空
              isThreeLine: true,
              // 控制 checkbox 选择框是在前面还是后面
              controlAffinity: ListTileControlAffinity.leading,
              // 是否将主题色应用到文字或者图标
              selected: true,
              onChanged: (checked) {
                setState(() {
                  _isTitleCheckd = checked;
                });
              }),
          SwitchListTile(
              title: Text('Turn On this item'),
              subtitle: Text(
                  'description...description...\ndescription...description...'),
              selected: true,
              isThreeLine: true,
              secondary: Image.asset(
                'images/ali.jpg',
                width: 30,
                height: 30,
              ),
              value: _isTitleOn,
              onChanged: (onState) {
                setState(() {
                  _isTitleOn = onState;
                });
              })
        ],
      ),
    );
  }
}
