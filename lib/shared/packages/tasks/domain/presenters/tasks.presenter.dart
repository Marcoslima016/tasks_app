import 'package:flutter/material.dart';

import '../domain.exports.dart';

abstract mixin class TasksPresenter {
  Future addNewTaskToList(PayloadNewTask payload, BuildContext context);

  Future setLoadedState({
    required List<Task> tasksList,
  });
}
