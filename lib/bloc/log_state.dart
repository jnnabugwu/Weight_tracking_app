part of 'log_cubit.dart';

abstract class LogState {
  const LogState();
}

class LogInitial extends LogState {}

class LogLoaded extends LogState {
  final List<Log> notes;

  LogLoaded({required this.notes});
}
