import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/helpers/state_obesrver.dart';

class AppConfig {
  final List<DeviceOrientation> _screenOrientations = [
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ];

  void setAppConfiguration() {
    Bloc.observer = BlocStatesObserver();
    SystemChrome.setPreferredOrientations(_screenOrientations);
  }
}