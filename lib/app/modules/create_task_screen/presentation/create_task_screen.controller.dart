import 'package:flutter/material.dart';
import '../create_task_screen.exports.dart';

class CreateTaskScreenController extends ValueNotifier<ICreateTaskScreenState> implements CreateTaskScreenPresenter {
  TextEditingController inputTitle = TextEditingController();
  @override
  String get getInputTitleText => inputTitle.text;

  TextEditingController inputDescription = TextEditingController();
  @override
  String get getInputDescriptionText => inputDescription.text;

  late CreateTaskScreenDependencies? dependencies;

  CreateTaskScreenController({
    this.dependencies,
  }) : super(FillState()) {
    dependencies ??= CreateTaskScreenDependencies(
      controller: this,
    );
    dependencies!.bind();
    _listenInputsUpdates();
  }

  void _listenInputsUpdates() {
    inputTitle.addListener(() => value.onInputUpdate(this));
    inputDescription.addListener(() => value.onInputUpdate(this));
  }

  Future onTapCreate(BuildContext context) => value.onTapCreate(this, context);

  void disposeController() {
    dependencies!.dispose();
  }
}
