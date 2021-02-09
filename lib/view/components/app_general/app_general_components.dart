import 'package:flutter/material.dart';

Widget navigator() {
  return Navigator(
    pages: [
      MaterialPage(
        key: ValueKey('BooksListPage'),
        child: Scaffold(),
      ),
    ],
    onPopPage: (route, result) => route.didPop(result),
  );
}