import 'package:flutter/foundation.dart';

class CompleteTaskProvider with ChangeNotifier {
  // Store completed state for each task using taskId
  final Map<String, bool> _completedTasks = {};

  bool isTaskCompleted(String taskId) {
    return _completedTasks[taskId] ?? false;
  }

  void toggleTaskCompletion(String taskId) {
    _completedTasks[taskId] = !(_completedTasks[taskId] ?? false);
    notifyListeners();
  }
}
