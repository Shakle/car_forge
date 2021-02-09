import 'package:car_forge/core/data/repository/themes.dart';
import 'package:flutter/material.dart';

/// Provides app [ThemeData]
class ThemeState {
  final ThemeData themeData;

  ThemeState({
    @required this.themeData
  }) : assert(themeData != null);
}

class ThemeInitial extends ThemeState {
  ThemeInitial() : super(themeData: Themes().lightTheme);
}