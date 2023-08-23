part of 'agents_cubit.dart';

@immutable
abstract class AgentsState {}

class AgentsInit extends AgentsState {}

class AgentsLoading extends AgentsState {}

class AgentsSucsses extends AgentsState {}

class AgentsFail extends AgentsState {}

class AgentsChanged extends AgentsState {}

class AgentsError extends AgentsState {}
