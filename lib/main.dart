import 'package:flutter/material.dart';
import 'package:tasks_app/lib.exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppController.I.init();
  runApp(const AppView());
}
