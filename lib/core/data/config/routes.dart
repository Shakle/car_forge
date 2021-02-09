import 'package:flutter/material.dart';

import '../../../view/screens/home_screen.dart';
import '../../../view/screens/screen_two.dart';

class Routes {
  static const String homeScreen = 'home';
  static const String secondScreen = 'second';

  Map<String, Widget> screens = {
    homeScreen: HomeScreen(),
    secondScreen: ScreenTwo(),
  };

  MaterialPage getMaterialPage({@required String name, Widget screenWithArguments}) {
    return MaterialPage(
      key: ValueKey(name),
      child: screenWithArguments ?? screens[name],
      name: name,
    );
  }

}