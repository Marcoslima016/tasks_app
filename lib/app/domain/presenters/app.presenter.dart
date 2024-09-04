import 'package:flutter/material.dart';

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
