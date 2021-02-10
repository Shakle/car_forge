import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationStackState> {
  NavigationBloc() : super(NavigationStackInitial());

  @override
  Stream<NavigationStackState> mapEventToState(NavigationEvent event) async* {
    final List<MaterialPage> newScreensStack = List.from(state.screenStack);

    if (event is NavigationPushed) {
      newScreensStack.add(event.screen);
      yield NavigationStackCurrent(screenStack: newScreensStack);

    } else if (event is NavigationPopped) {
      final MaterialPage screen = newScreensStack.lastWhere((s) => s.name == event.screenName);
      newScreensStack.remove(screen);
      yield NavigationStackCurrent(screenStack: newScreensStack);
    }
  }

}