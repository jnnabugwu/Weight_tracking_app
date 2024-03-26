import 'package:sofi_interview_2/model/log.dart';
import 'package:sofi_interview_2/repository/interface_repo.dart';

class NotebookRepository implements INotebookRepository {
  List<Log> notes = [];
//i have a feeling that this is wrong because im passing in an empty notes list
  NotebookRepository({required this.notes});

  @override
  void addLog(Log note) {
    try {
      notes.add(note);
    } on Exception catch (e) {
      throw 'Something went wrong: $e';
    }
  }

  @override
  List<Log> getAllLogs() {
    return notes;
  }
}
