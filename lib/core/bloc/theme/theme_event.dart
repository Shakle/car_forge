import 'package:flutter/material.dart';

class ThemeEvent {}

/// Provides theme set [ThemeEvent]
class ThemeSet extends ThemeEvent {
  final ThemeData themeData;

  ThemeSet({
    @required this.themeData
  }) : assert(themeData != null);
}