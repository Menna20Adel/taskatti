import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskatti/features/add_task/data/task_model.dart';

class AppLocalStorage {
  static late Box box;
  static late Box<TaskModel> taskBox;
  init() {
    box = Hive.box('user');
    taskBox = Hive.box('task');
  }

  static cacheDate(key, value) {
    box.put(key, value);
  }

  static getCachedData(key) {
    return box.get(key);
  }

  static cacheTask(key, TaskModel value) {
    taskBox.put(key, value);
  }

  static TaskModel? getTask(key) {
    return taskBox.get(key);
  }
}
