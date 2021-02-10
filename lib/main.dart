import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/helpers/state_obesrver.dart';
import 'core/bloc/navigation/navigation_bloc.dart';
import 'core/bloc/theme/theme_bloc.dart';
import 'core/bloc/theme/theme_state.dart';
import 'core/data/config/routes.dart';
import 'core/data/database/app_data.dart';
import 'view/components/app_general/app_general_components.dart';

/// * [Bloc.observer] shows states change
void main() {
  Bloc.observer = BlocStatesObserver();

  runApp(CarForge());
}

/// * [MultiBlocProvider] provides global states for [Theme],[Navigator], etc.
class CarForge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
          BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
        ],
        child: application(),
    );
  }

  Widget application() {
    return BlocBuilder<ThemeBloc, ThemeState>(
    builder: (context, themeState) {
      return MaterialApp(
        title: AppData().appName,
        theme: themeState.themeData,
        navigatorKey: Routes.navigatorKey,
        home: navigator(),
      );
    });
  }
}