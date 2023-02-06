import 'package:flutter/material.dart';

class SSDTheme {
  final ThemeData themeData;

  SSDTheme(this.themeData);
  BoxDecoration get containerDecoration => BoxDecoration(
        color: themeData.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: themeData.colorScheme.primary),
      );
}
