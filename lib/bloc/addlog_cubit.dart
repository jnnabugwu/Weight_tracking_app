import 'package:bloc/bloc.dart';
import 'package:sofi_interview_2/bloc/log_cubit.dart';
import 'package:sofi_interview_2/model/log.dart';
import 'package:sofi_interview_2/repository/notebook.dart';

part 'addlog_state.dart';

class AddLogCubit extends Cubit<AddLogState> {
  AddLogCubit(this.repository, this.logCubit) : super(AddLogInitial());

  final NotebookRepository repository;

  /// add the notecubit
  final LogCubit logCubit;

  void addLog(Log log) {
    emit(AddingLog());

    /// have the Log cubit add the log
    logCubit.addNote(log);

    ///emit Note has been added
    emit(LogAdded());
    //One question i have is how does the cubit get the repository
  }
}
