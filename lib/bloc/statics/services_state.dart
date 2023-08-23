part of 'services_cubit.dart';

abstract class ServicesState {}

class ServicesInit extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesSucsses extends ServicesState {}

class ServicesFail extends ServicesState {}

class ServicesChanged extends ServicesState {}

class ServicesError extends ServicesState {}
