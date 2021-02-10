import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/navigation/navigation_bloc.dart';
import '../../../core/bloc/navigation/navigation_event.dart';
import '../../../core/bloc/navigation/navigation_state.dart';


/// * [Navigator] handles navigator 2.0 routing with [NavigationBloc] states
Widget navigator() {
  return BlocBuilder<NavigationBloc, NavigationStackState>(
    builder: (context, state) {
      return Navigator(
        pages: state.screenStack,
        onPopPage: (route, result) {
          if (route.didPop(result)) {
            BlocProvider.of<NavigationBloc>(context).add(NavigationPopped(screenName: route.settings.name));
            return true;
          } else {
            return false;
          }
        },
      );
    }
  );
}