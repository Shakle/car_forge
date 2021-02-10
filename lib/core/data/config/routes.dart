import 'package:flutter/material.dart';

import '../../../view/screens/arguments/screens_arguments.dart';
import '../../../view/screens/home_screen.dart';
import '../../../view/screens/screen_two.dart';

class ScreenData {
  final Widget screen;
  final dynamic screenArguments;

  ScreenData({@required this.screen, this.screenArguments});
}

class Routes {

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String homeScreen = 'home';
  static const String secondScreen = 'second';

  final Map<String, ScreenData> _screens = {
    homeScreen: ScreenData(screen: HomeScreen()),
    secondScreen: ScreenData(
        screen: ScreenTwo(),
        screenArguments: ScreenTwoArguments(),
    ),
  };

  MaterialPage materialPage({@required String name, dynamic screenArguments}) {
    final ScreenData screenData = _screens[name];
    assert(screenArguments == null || screenArguments.runtimeType == screenData.screenArguments.runtimeType,
      'Wrong screen arguments. Expected: ${screenArguments.runtimeType}, '
          'but received: ${screenData.screenArguments.runtimeType}');

    return MaterialPage(
      key: ValueKey(name),
      child: screenData.screen,
      name: name,
      arguments: screenArguments
    );
  }

  dynamic getArguments(BuildContext context) => ModalRoute.of(context)?.settings?.arguments;

}