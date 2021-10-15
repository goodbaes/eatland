import 'package:flutter/material.dart';

class AppTransform {
  static Matrix4 hoverMatrix = (Matrix4.identity()
    ..setEntry(2, 3, 0.001)
    ..rotateX(0.01 * 30)
    ..rotateY(-0.01 * 20));
}
