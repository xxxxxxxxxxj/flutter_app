import 'package:flutter/material.dart';

class ThirdIcons {
  // codePoint 值通过打开 `demo_index.html` 获取
  // 会在相应 icon 下带有相应的 code，把 `&#` 替换成 `0`，然后去掉最后的 `;` 即可
  // 例如 &#xe672; 对应我们需要的图标就是 0xe672
  static const IconData username = IconData(0xe677);
  static const IconData password = IconData(0xe623);
}

class ThirdIconData extends IconData {
  const ThirdIconData(int codePoint)
      : super(codePoint, fontFamily: 'IconFonts');
}
