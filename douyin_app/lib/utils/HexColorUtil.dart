import 'package:flutter/material.dart';

class HexColorUtil {
  // 解析16进制字符串为Color对象
  static Color fromHex(String hexString) {
    String hex = hexString.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF' + hex; // 默认透明度为1（FF）
    } else if (hex.length == 3) {
      hex = 'FF' + hex[0] + hex[0] + hex[1] + hex[1] + hex[2] + hex[2]; // 简写形式
    }
    return Color(int.parse(hex, radix: 16));
  }
}
