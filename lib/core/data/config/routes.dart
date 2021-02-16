import 'package:flutter/material.dart';

import '../../../view/screens/home.dart';

class ScreenData {
  final Widget screen;
  final dynamic screenArguments;

  ScreenData({@required this.screen, this.screenArguments});
}

class Routes {

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String homeScreen = 'home';

  final Map<String, ScreenData> _screens = {
    homeScreen: ScreenData(screen: HomeScreen()),
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