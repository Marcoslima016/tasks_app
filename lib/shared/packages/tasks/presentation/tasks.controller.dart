import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tasks_app/lib.exports.dart';

class TasksController extends ValueNotifier<ITasksState> with TasksPresenter {
  late TasksDependencies? dependencies;

  static TasksController get I => GetIt.I.get<TasksController>();

  TasksController({
    required AppController appController,
    this.dependencies,
  }) : super(InitialState()) {
    dependencies ??= TasksDependencies(
      appController: appController,
      tasksController: this,
    );
  }

  Future initialize() async => value.initialize(this);

  Future onTapGoToCreateTask() => value.onTapGoToCreateTask(this);

  @override
  Future addNewTaskToList(PayloadNewTask payload) async => value.addNewTask(payload);

  Future concludeTask() async {}

  Future deleteTaskFromList() async {}

  @override
  Future setLoadedState({required List<Task> tasksList}) async {
    value = TasksLoaded(
      controller: this,
      tasksList: tasksList,
    );
  }
}
