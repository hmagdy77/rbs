part of 'campagin_cubit.dart';

@immutable
abstract class CampaginState {}

class CampaginInit extends CampaginState {}

class CampaginLoading extends CampaginState {}

class CampaginSucsses extends CampaginState {}

class CampaginFail extends CampaginState {}

class CampaginChanged extends CampaginState {}

class CampaginError extends CampaginState {}
