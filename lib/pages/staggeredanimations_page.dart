import 'package:flutter/material.dart';

class StaggeredAnimationsPage extends StatelessWidget {
  AnimationController animationController;
  Animation<double> opactity;
  Animation<double> width;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<BorderRadius> border;
  Animation<Color> color;
  Animation<double> rotate;

  //构造器中赋值
  StaggeredAnimationsPage({Key key, this.animationController})
      :
        // widget 透明度
        opactity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(0.0, 1.0, curve: Curves.ease))),
        //widget宽
        width = Tween(begin: 50.0, end: 150.0).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(0.1, 0.250, curve: Curves.ease))),
        //widget高
        height = Tween(begin: 50.0, end: 150.0).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(0.250, 0.375, curve: Curves.ease))),
        //widget底部距离
        padding = EdgeInsetsTween(
                begin: EdgeInsets.only(top: 150.0),
                end: EdgeInsets.only(top: 0.0))
            .animate(CurvedAnimation(
                parent: animationController,
                curve: Interval(0.25, 0.375, curve: Curves.ease))),
        //widget旋转
        rotate = Tween(begin: 0.0, end: 0.25).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(0.375, 0.5, curve: Curves.ease))),
        //widget外形
        border = BorderRadiusTween(
                begin: BorderRadius.circular(5.0),
                end: BorderRadius.circular(75.0))
            .animate(CurvedAnimation(
                parent: animationController,
                curve: Interval(0.5, 0.75, curve: Curves.ease))),
        //widget颜色
        color = ColorTween(begin: Colors.blue, end: Colors.orange).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(0.75, 1.0, curve: Curves.ease))),
        super(key: key);

  Widget _buildAnimWidget(BuildContext context, Widget child) {
    return Container(
      padding: padding.value,
      alignment: Alignment.center,
      //旋转变化
      child: RotationTransition(
        turns: rotate, // turns 表示当前动画的值 * 360° 角度
        child: Opacity(
          opacity: opactity.value, // 透明度变化
          child: Container(
            width: width.value, // 宽度变化
            height: height.value, // 高度变化
            decoration: BoxDecoration(
                color: color.value, // 颜色变化
                border: Border.all(color: Colors.indigo[300], width: 3.0),
                borderRadius: border.value), // 外形变化
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // AnimatedBuilder 继承 AnimationWidget，用来快速构建动画部件
    return AnimatedBuilder(
      animation: animationController,
      builder: _buildAnimWidget,
    );
  }
}
