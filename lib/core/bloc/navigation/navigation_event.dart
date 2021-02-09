import 'package:flutter/material.dart';

abstract class NavigationEvent {}

class NavigationPushed extends NavigationEvent {
  final MaterialPage screen;

  NavigationPushed({this.screen});
}

class NavigationPopped extends NavigationEvent {}