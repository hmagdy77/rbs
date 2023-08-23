part of 'users_cubit.dart';

@immutable
abstract class UsersState {}

class UsersInit extends UsersState {}

class UsersLoading extends UsersState {}

class UsersSucsses extends UsersState {}

class UsersFail extends UsersState {}

class UsersChanged extends UsersState {}

class UsersError extends UsersState {}
