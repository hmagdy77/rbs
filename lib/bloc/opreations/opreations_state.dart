part of 'opreations_cubit.dart';

abstract class OpreationsState {}

class OpreationsInit extends OpreationsState {}

class OpreationsLoading extends OpreationsState {}

class OpreationsSucsses extends OpreationsState {}

class OpreationsFail extends OpreationsState {}

class OpreationsChanged extends OpreationsState {}

class OpreationsError extends OpreationsState {}
