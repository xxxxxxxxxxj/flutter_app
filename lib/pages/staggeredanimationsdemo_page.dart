import 'package:flutter/material.dart';
import 'package:flutter_app/pages/staggeredanimations_page.dart';

/**
 * 交错动画
 */
class StaggeredAnimationsDemoPage extends StatefulWidget {
  @override
  _StaggeredAnimationsDemoPageState createState() =>
      _StaggeredAnimationsDemoPageState();
}

class _StaggeredAnimationsDemoPageState
    extends State<StaggeredAnimationsDemoPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnim() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      print('cancel');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StaggeredAnimation Demo'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _playAnim,
        child: Center(
          // 定义一个外层圈，能够使动画显眼点
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: Border.all(color: Colors.black.withOpacity(0.5))),
            child: StaggeredAnimationsPage(animationController: _controller),
          ),
        ),
      ),
    );
  }
}
