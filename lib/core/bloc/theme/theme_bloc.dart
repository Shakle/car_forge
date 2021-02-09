import 'package:car_forge/core/bloc/theme/theme_event.dart';
import 'package:car_forge/core/bloc/theme/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial());

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeSet) {
      yield ThemeState(themeData: event.themeData);
    }
  }

}