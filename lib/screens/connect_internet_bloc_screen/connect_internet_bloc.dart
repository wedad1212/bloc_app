import 'package:bloc_app/bloc_internet/internet_bloc.dart';
import 'package:bloc_app/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectInternetHome extends StatelessWidget {
  const ConnectInternetHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("connect".tr(context)),
      ),
      body: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
              listener: (context, state) {
        if (state is ConnectInternetState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message),backgroundColor: Colors.green,));
        }
        else if (state is NoConnectInternetState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message),backgroundColor: Colors.red,));
        }
      }, builder: (context, state) {
        if (state is ConnectInternetState) {
          return Text(
            state.message,
            style: const TextStyle(fontSize: 20),
          );
        } else if (state is NoConnectInternetState) {
          return Text(
            state.message,
            style: const TextStyle(fontSize: 20),
          );
        }
        return const SizedBox();
      })),
    );
  }
}
