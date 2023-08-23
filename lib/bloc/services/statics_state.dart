part of 'statics_cubit.dart';

@immutable
abstract class StaticsState {}

class StaticsInit extends StaticsState {}

class StaticsLoading extends StaticsState {}

class StateSucsses extends StaticsState {}

class StateFail extends StaticsState {}

class StateChanged extends StaticsState {}

class StateError extends StaticsState {}
