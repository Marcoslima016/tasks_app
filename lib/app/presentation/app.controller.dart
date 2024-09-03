import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:tasks_app/lib.exports.dart';

abstract class AppPresenter {
  Future navigateToRoute({
    required String route,
    bool replaceCurrentRoute = false,
  });

  Future pop(BuildContext context);
}

class AppController implements AppPresenter {
  static AppController get I {
    if (GetIt.I.isRegistered<AppController>()) {
      return GetIt.I.get<AppController>();
    } else {
      GetIt.I.registerSingleton<AppController>(AppController());
      return GetIt.I.get<AppController>();
    }
  }

  late final TasksController tasksController;

  AppController() {
    tasksController = TasksController(appController: this);
  }

  Future init() async {
    tasksController.initialize();
  }

  @override
  Future navigateToRoute({
    required String route,
    bool replaceCurrentRoute = false,
  }) async {
    if (replaceCurrentRoute) {
      Navigator.of(Get.context!).pushReplacementNamed(route);
    } else {
      Navigator.of(Get.context!).pushNamed(route);
    }
  }

  @override
  Future pop(BuildContext context) async {
    Navigator.of(context).pop();
  }
}
