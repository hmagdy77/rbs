part of 'alerts_cubit.dart';

@immutable
abstract class AlertsState {}

class AlertsInit extends AlertsState {}

class AlertsLoading extends AlertsState {}

class AlertsSucsses extends AlertsState {}

class AlertsFail extends AlertsState {}

class AlertsChanged extends AlertsState {}

class AlertsError extends AlertsState {}
