part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent {}
class ConnectInternetEvent extends InternetEvent{}

class NoConnectInternetEvent extends InternetEvent{}