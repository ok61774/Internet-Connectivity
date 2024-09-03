part of 'internet_bloc.dart';

@immutable
sealed class InternetState {}

final class InternetInitial extends InternetState {}

class InternetLostState extends InternetState{}

class InternetGainedState extends InternetState{}
