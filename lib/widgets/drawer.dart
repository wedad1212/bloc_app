import 'package:bloc_app/bloc_theme/theme_bloc.dart';
import 'package:bloc_app/screens/connect_internet_bloc_screen/connect_internet_bloc.dart';
import 'package:bloc_app/screens/posts/screens/home_posts.dart';
import 'package:bloc_app/screens/todos_freezed/screens/home_freezed.dart';
import 'package:bloc_app/screens/todos_v1/screens/home_todos.dart';


import 'package:bloc_app/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerStyle extends StatelessWidget {
  const DrawerStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConnectInternetHome()));
              },
              child: Text("connect-bloc".tr(context))),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConnectInternetHome()));
              },
              child: Text("connect-cubit".tr(context))),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("theme-l".tr(context)),
              BlocBuilder<ThemeBloc, ThemeData>(builder: (context, state) {
                return Switch(
                    activeColor: Colors.blue,
                    inactiveThumbColor: Colors.blue,
                    inactiveTrackColor:
                        const Color.fromARGB(255, 231, 224, 224),
                    value: state == ThemeData.dark(),
                    onChanged: (value) {
                      BlocProvider.of<ThemeBloc>(context)
                          .add(SwichThemeEvent());
                    });
              }),
              Text("theme-d".tr(context)),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeTodos()));
              },
              child: const Text("Get Data form Api")),
            const  SizedBox(height: 15,),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePosts()));
              },
              child: const Text("Get Data Posts")),
                  ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeFreezed()));
              },
              child: const Text("Get Todos with freezed"))
        ],
      ),
    );
  }
}
