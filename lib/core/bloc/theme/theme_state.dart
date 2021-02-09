import 'package:flutter/material.dart';

import '../../data/config/themes.dart';

/// Provides app [ThemeData]
abstract class ThemeState {
  final ThemeData themeData;

  ThemeState({
    @required this.themeData
  }) : assert(themeData != null, 'ThemeData must not be null');
}

/// Provides default light [ThemeData]
class ThemeInitial extends ThemeState {
  ThemeInitial() : super(themeData: Themes().lightTheme);
}

/// Provides chosen theme [ThemeData]
class ThemeChosen extends ThemeState {
  ThemeChosen({ThemeData themeData}) : super(themeData: themeData);
}