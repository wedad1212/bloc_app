import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? streamSubscription;
  InternetCubit() : super(InternetInitial());
  connectInternet() {
    emit(ConnectInternetState(message: "Connect Internet"));
  }

  noConnectInternet() {
    emit(NoConnectInternetState(message: "No Connect Internet"));
  }

  void checkInternet() {
    streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
     connectInternet();
      } else {
        noConnectInternet();
      }
    });
    // ignore: unused_element
    close() {
      streamSubscription!.cancel();
      super.close();
    }
  }
}
