import 'package:flutter/material.dart';

//因为 Animation 是抽象类，所以具体的还是需要通过 AnimationController 来实现。
//AnimationController 控制动画的方法有这么几个
//
//forward 启动动画，和上面提到的 forward 状态不一样
//reverse 方向启动动画
//repeat 重复使动画运行
//stop 停止动画
//reset 重置动画
class AnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimationState();
  }
}

class _AnimationState extends State<AnimationPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _scaleAnimation; //动画实例，用于修改值的大小
  Animation<Color> _colorAnimation; //控制图标颜色
  Animation<Offset> _positionAnimation; //控制图标位置

  @override
  void initState() {
    super.initState();
    /*_animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
        lowerBound: 10,
        upperBound: 300);*/
    //不通过 `lowerBound` 和 `upperBound` 设置范围，改用 `Tween`
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    //当动画值改变的时候，重绘下
    //在上面的例子中，都是通过 addListener 监听动画值变化，然后通过 setState 方法来实现刷新效果。那么 Flutter
    // 也提供了一个部件 AnimationWidget 来实现动画部件，就不需要一直监听了，还是实现上面的例子
    /*_animationController.addListener(() {
      setState(() {});
    });*/
    //循环执行动画
    _animationController.addStatusListener((status) {
      if (_animationController.status == AnimationStatus.completed) {
        //正向结束后开始反向
        _animationController.reverse();
      } else if (_animationController.status == AnimationStatus.dismissed) {
        //反向结束后开始正向
        _animationController.forward();
      }
    });
    // 通过 `Tween` 的 `animate` 生成一个 Animation
    // 再通过  Animation.value 进行值的修改
    // 通过 `chain` 结合 `CurveTween` 修改动画的运动方式，曲线类型可自行替换
    _scaleAnimation = Tween(begin: 10.0, end: 100.0)
        .chain(CurveTween(curve: Curves.decelerate))
        .animate(_animationController);
    _colorAnimation = ColorTween(begin: Colors.red[100], end: Colors.red[900])
        .chain(CurveTween(curve: Curves.easeIn))
        .animate(_animationController);
    _positionAnimation = Tween(begin: Offset(0, 0), end: Offset(300, 500))
        .chain(CurveTween(curve: Curves.bounceInOut))
        .animate(_animationController);
    //启动动画
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationPage Demo'),
      ),
      /*body: Stack(
        children: <Widget>[
          Positioned(
              left: _positionAnimation.value.dx,
              top: _positionAnimation.value.dy,
              child: Icon(
                Icons.favorite,
                color: _colorAnimation.value,
                size: _scaleAnimation.value,
              ))
        ],
      ),*/
      body: RunningHeart([_colorAnimation, _scaleAnimation, _positionAnimation],
          _animationController),
    );
  }
}

//在上面的例子中，都是通过 addListener 监听动画值变化，然后通过 setState 方法来实现刷新效果。
// 那么 Flutter 也提供了一个部件 AnimationWidget 来实现动画部件，就不需要一直监听了，还是实现上面的例子
class RunningHeart extends AnimatedWidget {
  List<Animation> _animations; //动画列表
  AnimationController _animationController; //控制动画

  RunningHeart(this._animations, this._animationController)
      : assert(_animations.length == 3),
        assert(_animations[0] is Animation<Color>),
        assert(_animations[1] is Animation<double>),
        assert(_animations[2] is Animation<Offset>),
        super(listenable: _animationController);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            left: _animations[2].value.dx,
            top: _animations[2].value.dy,
            child: Icon(
              Icons.favorite,
              color: _animations[0].value,
              size: _animations[1].value,
            ))
      ],
    );
  }
}
