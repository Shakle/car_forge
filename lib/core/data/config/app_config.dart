import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/helpers/state_obesrver.dart';

class AppConfig {
  final List<DeviceOrientation> _screenOrientations = [
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ];

  void setAppConfiguration() {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = BlocStatesObserver();
    SystemChrome.setPreferredOrientations(_screenOrientations);
  }

  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
}