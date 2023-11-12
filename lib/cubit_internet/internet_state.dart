part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

final class InternetInitial extends InternetState {}

class ConnectInternetState extends InternetState {
  final String message;

  ConnectInternetState({required this.message});
}

class NoConnectInternetState extends InternetState {
  final String message;

  NoConnectInternetState({required this.message});
}
