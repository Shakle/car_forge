import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/helpers/state_obesrver.dart';
import 'core/bloc/navigation/navigation_bloc.dart';
import 'core/bloc/navigation/navigation_state.dart';
import 'core/bloc/theme/theme_bloc.dart';
import 'core/bloc/theme/theme_state.dart';
import 'core/data/database/app_data.dart';

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
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return BlocBuilder<NavigationBloc, NavigationStackState>(
              builder: (context, navigationState) {
                return application(themeState: themeState, navigationState: navigationState);
              }
            );
          }
        )
    );
  }

  /// * [themeState] provides currently selected [ThemeData]
  /// * [navigationState] provides current [NavigationStackState]
  Widget application({
    @required ThemeState themeState,
    @required NavigationStackState navigationState
  }) {
    return MaterialApp(
      title: AppData().appName,
      theme: themeState.themeData,
      home: Navigator(
        pages: [
           MaterialPage(
            key: ValueKey('BooksListPage'),
            child: Scaffold(),
          )
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}