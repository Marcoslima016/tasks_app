import 'package:flutter/material.dart';
import '../create_task_screen.exports.dart';

class CreateTaskScreenController extends ValueNotifier<ICreateTaskScreenState> implements CreateTaskScreenPresenter {
  TextEditingController inputTitle = TextEditingController();
  @override
  String get getInputTitleText => inputTitle.text;

  TextEditingController inputDescription = TextEditingController();

  late final CreateTaskScreenDependencies dependencies;
  CreateTaskScreenController({
    CreateTaskScreenDependencies? dependencies,
  }) : super(FillState()) {
    this.dependencies = dependencies ??= CreateTaskScreenDependencies(
      controller: this,
    );
    dependencies.bind();
    _listenInputsUpdates();
  }

  void _listenInputsUpdates() {
    inputTitle.addListener(() => value.onInputUpdate(this));
    inputDescription.addListener(() => value.onInputUpdate(this));
  }

  Future onTapCreate() async {
    //
  }
}
