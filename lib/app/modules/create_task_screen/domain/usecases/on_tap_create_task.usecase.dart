import 'package:flutter/material.dart';
import 'package:tasks_app/lib.exports.dart';

abstract class IOnTapCreateTask {
  Future call(BuildContext context);
}

class OnTapCreateTask implements IOnTapCreateTask {
  final CreateTaskScreenPresenter createTaskScreenPresenter;
  final TasksPresenter tasksPresenter;
  final AppPresenter appPresenter;

  OnTapCreateTask({
    required this.createTaskScreenPresenter,
    required this.tasksPresenter,
    required this.appPresenter,
  });

  @override
  Future call(BuildContext context) async {
    try {
      appPresenter.pop(context);
      tasksPresenter.addNewTaskToList(
        PayloadNewTask(
          title: createTaskScreenPresenter.getInputTitleText,
          description: createTaskScreenPresenter.getInputDescriptionText,
        ),
        context,
      );
    } catch (e) {
      rethrow;
    }
  }
}
