import 'package:flutter/material.dart';

abstract class ThemeEvent {
  final ThemeData themeData;

  ThemeEvent({
    @required this.themeData
  }) : assert(themeData != null, 'ThemeData must not be null');
}

/// Provides theme set [ThemeEvent]
class ThemeSet extends ThemeEvent {
  ThemeSet({@required ThemeData themeData}) : super(themeData: themeData);
}