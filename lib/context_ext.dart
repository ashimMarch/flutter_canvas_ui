import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  Size get mqSize => MediaQuery.of(this).size;
  double get mqHeight => mqSize.height;
  double get mqWidth => mqSize.width;
}
