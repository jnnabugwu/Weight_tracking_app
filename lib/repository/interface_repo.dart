import 'package:sofi_interview_2/model/log.dart';

abstract class INotebookRepository {
  void addLog(Log note);
  List<Log> getAllLogs();
}
