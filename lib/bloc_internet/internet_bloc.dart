import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? streamSubscription;
  InternetBloc() : super(InternetInitial()) {
    on<InternetEvent>((event, emit) {
      if (event is ConnectInternetEvent) {
        emit(ConnectInternetState(message: "connect Internet"));
      } else if (event is NoConnectInternetEvent) {
        emit(NoConnectInternetState(message: "No Connect Internet"));
      }
    });

    streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(ConnectInternetEvent());
      } else {
        add(NoConnectInternetEvent());
      }
    });
  }
}
