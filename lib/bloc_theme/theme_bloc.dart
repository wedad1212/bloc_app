import 'package:bloc_app/service/shared_pre_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(ThemeData.light()) {
    // start application
    on<InitialThemeEvent>((event, emit) async {
      final result = await HelperSharedPreTheme().getTheme();
      if (result) {
        emit(ThemeData.dark());
      } else {
        emit(ThemeData.light());
      }
    });

    // When the user clicks on switch
    on<SwichThemeEvent>((event, emit) {
      final isDark = state == ThemeData.dark();
      emit(isDark ? ThemeData.light() : ThemeData.dark());
      HelperSharedPreTheme().setTheme(isDark);
    });
  }
}
