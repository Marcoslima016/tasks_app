import 'package:flutter/material.dart';
import 'package:tasks_app/lib.exports.dart';

abstract class IConcludeTask {
  Future call({
    required Task task,
    required BuildContext context,
  });
}

class ConcludeTask implements IConcludeTask {
  final AppPresenter appPresenter;

  ConcludeTask({
    required this.appPresenter,
  });

  @override
  Future call({
    required Task task,
    required BuildContext context,
  }) async {
    try {
      appPresenter.showMessageDialog(
        context: context,
        title: "Tarefa concluída",
        text: "A partir de agora essa tarefa irá apresentar o status 'Concluído'",
      );
    } catch (e) {
      rethrow;
    }
  }
}
