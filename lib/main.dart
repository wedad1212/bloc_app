import 'package:bloc_app/bloc_internet/internet_bloc.dart';
import 'package:bloc_app/bloc_observer/bloc_observer.dart';
import 'package:bloc_app/bloc_theme/theme_bloc.dart';
import 'package:bloc_app/cubit_internet/internet_cubit.dart';
import 'package:bloc_app/cupit_locale/local_cubit.dart';

import 'package:bloc_app/screens/home_screen/home.dart';
import 'package:bloc_app/screens/posts/bloc/posts_bloc.dart';
import 'package:bloc_app/screens/todos_freezed/todo/todo_bloc.dart';
import 'package:bloc_app/screens/todos_v1/bloc/todos_bloc.dart';
import 'package:bloc_app/screens/todos_v1/data/todo_api.dart';

import 'package:bloc_app/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ThemeBloc()..add(InitialThemeEvent())),
          BlocProvider(create: (context) => LocalCubit()..getLaguage()),
          BlocProvider(create: (context) => InternetBloc()),
          BlocProvider(create: (context) => InternetCubit()..checkInternet()),
          BlocProvider(
              create: (context) =>
                  TodosBloc(todoApi: TodoApi())..add(GetTodosEvent())),
          BlocProvider(create: (context) => PostsBloc()..add(GetPostsEvent())),
          BlocProvider(
              create: ((context) =>
                  TodoBloc()..add(const TodoEvent.getTodoEvent()))),
        ],

        // child: BlocBuilder<LocalCubit, ChangeLocalState>(
        //     builder: (context, state) {
        child: BlocBuilder<ThemeBloc, ThemeData>(builder: (context, state) {
          return MaterialApp(
            locale: const Locale("en"),
            // locale: Locale(state.locale),
            theme: state,

            // Languages supported by the application
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            // For directions and translation widgets
            localizationsDelegates: const [
              AppLocalization.delegte,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            // function to find device language
            localeResolutionCallback: (deviceLocal, supportedLocales) {
              for (var local in supportedLocales) {
                if (deviceLocal != null &&
                    local.languageCode == deviceLocal.languageCode) {
                  return deviceLocal;
                }
              }
              // if don't device language in language supported by app return en
              return supportedLocales.first;
            },

            title: 'Flutter Details Bloc',
            debugShowCheckedModeBanner: false,

            home: const Home(),
          );
        }));
  }
}
