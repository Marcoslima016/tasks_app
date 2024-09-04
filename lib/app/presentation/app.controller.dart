import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:tasks_app/lib.exports.dart';
import 'app.dependencies.dart';

abstract class AppPresenter {
  Future navigateToRoute({
    required String route,
    bool replaceCurrentRoute = false,
  });

  Future pop(BuildContext context);

  Future showMessageDialog({
    required BuildContext context,
    required String title,
    required String text,
  });
}

class AppController implements AppPresenter {
  static AppController get I {
    if (GetIt.I.isRegistered<AppController>()) {
      return GetIt.I.get<AppController>();
    } else {
      return AppController();
    }
  }

  AppDependencies dependencies = AppDependencies();

  AppController() {
    GetIt.I.registerSingleton<AppController>(this);
  }

  Future initialize() async {
    dependencies.bind();
    dependencies.tasksController!.initialize();
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
  Future pop(
    BuildContext context,
  ) async {
    Navigator.of(context).pop();
  }

  @override
  Future showMessageDialog({
    required BuildContext context,
    required String title,
    required String text,
  }) async {
    return await AppDialog.message(
      title: title,
      text: text,
    ).show(context: context);
  }
}
