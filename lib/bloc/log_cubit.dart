import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sofi_interview_2/repository/notebook.dart';
import '../model/log.dart';

part 'log_state.dart';

class LogCubit extends Cubit<LogState> {
  final NotebookRepository repository;

  LogCubit({required this.repository}) : super(LogInitial());

  void getAllLogs() {
    var notes = repository.getAllLogs();
    emit(LogLoaded(notes: notes));
  }

  addNote(Log log) {
    final currentState = state;
    if (currentState is LogLoaded) {
      final notes = currentState.notes;
      notes.add(log);
      emit(LogLoaded(notes: notes));
    }
  }
}
