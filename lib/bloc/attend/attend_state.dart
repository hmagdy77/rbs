part of 'attend_cubit.dart';

@immutable
abstract class AttendState {}

class AttendInit extends AttendState {}

class AttendLoading extends AttendState {}

class AttendSucsses extends AttendState {}

class AttendFail extends AttendState {}

class AttendChanged extends AttendState {}

class AttendError extends AttendState {}
