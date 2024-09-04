import 'package:flutter/material.dart';

import '../tasks.exports.dart';

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

abstract class ITasksState {
  List<Task>? get tasksList => null;

  Future initialize(TasksController controller) async {}

  Future onTapGoToCreateTask(TasksController controller) async {}

  Future addNewTask(PayloadNewTask payload) async {}

  Future concludeTask(
    Task task,
    BuildContext context,
  ) async {}
}

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

class InitialState extends ITasksState {
  @override
  Future initialize(TasksController controller) async {
    try {
      controller.value = BootingTasks(controller: controller);
      controller.dependencies!.bind();
      List<Task> tasksList = await controller.dependencies!.usecaseInitTasks!();
      controller.value = TasksLoaded(
        controller: controller,
        tasksList: tasksList,
      );
    } catch (e) {
      rethrow;
    }
  }
}

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

class BootingTasks extends ITasksState {
  final TasksController controller;
  BootingTasks({
    required this.controller,
  });
}

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

class TasksLoaded extends ITasksState {
  final TasksController controller;

  @override
  final List<Task> tasksList;

  TasksLoaded({
    required this.controller,
    required this.tasksList,
  });

  @override
  Future onTapGoToCreateTask(TasksController controller) async {
    await controller.dependencies!.usecaseOnTapGoToCreateTask!();
  }

  @override
  Future addNewTask(PayloadNewTask payload) async {
    controller.value = ReloadingTasks(controller: controller);
    await controller.dependencies!.usecaseAddNewTask!(payload: payload);
  }

  @override
  Future concludeTask(Task task, BuildContext context) async {
    controller.value = ReloadingTasks(controller: controller);
    await controller.dependencies!.usecaseConcludeTask!(
      context: context,
      task: task,
    );
  }
}

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
class ReloadingTasks extends ITasksState {
  final TasksController controller;
  ReloadingTasks({
    required this.controller,
  });
}
