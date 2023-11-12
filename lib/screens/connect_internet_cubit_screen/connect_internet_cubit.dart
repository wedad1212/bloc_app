import 'package:bloc_app/cubit_internet/internet_cubit.dart';
import 'package:bloc_app/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectInternetCubit extends StatelessWidget {
  const ConnectInternetCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("connect-cubit".tr(context)),
          centerTitle: true,
        ),
        body: Center(
          child: BlocBuilder(builder: (context, state) {
            if (state is ConnectInternetState) {
              return Text(state.message);
            } else if (state is ConnectInternetState) {
              return Text(state.message);
            }
            return const SizedBox();
          }),
        ));
  }
}
