part of 'reports_cubit.dart';

@immutable
abstract class ReportsState {}

class ReportsStateInit extends ReportsState {}

class ReportsStateLoading extends ReportsState {}

class ReportsStateSucsses extends ReportsState {}

class ReportsStateFail extends ReportsState {}

class ReportsStateChanged extends ReportsState {}

class ReportsStateError extends ReportsState {}
