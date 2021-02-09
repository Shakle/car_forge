import 'package:car_forge/core/bloc/helpers/state_obesrver.dart';
import 'package:car_forge/core/bloc/theme/theme_bloc.dart';
import 'package:car_forge/core/bloc/theme/theme_state.dart';
import 'package:car_forge/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocProvider<ThemeBloc>(create: (BuildContext context) => ThemeBloc()),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (BuildContext context, ThemeState themeState) {
            return application(themeState: themeState);
          }
        )
    );
  }

  /// * [themeState] provides currently selected [ThemeData]
  Widget application({@required ThemeState themeState}) {
    return MaterialApp(
      title: 'Car Forge',
      theme: themeState.themeData,
      home: HomeScreen(),
    );
  }
}