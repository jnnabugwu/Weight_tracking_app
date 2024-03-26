part of 'addlog_cubit.dart';

abstract class AddLogState {
  const AddLogState();
}

class AddLogInitial extends AddLogState {}

class AddLogError extends AddLogState {
  final String error;

  AddLogError({required this.error});
}

class AddingLog extends AddLogState {}

class LogAdded extends AddLogState {}
