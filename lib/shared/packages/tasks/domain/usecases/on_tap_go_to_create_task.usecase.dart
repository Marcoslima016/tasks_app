import 'package:tasks_app/lib.exports.dart';

abstract class IOnTapGoToCreateTask {
  Future call();
}

class OnTapGoToCreateTask implements IOnTapGoToCreateTask {
  final AppPresenter appPresenter;

  OnTapGoToCreateTask({
    required this.appPresenter,
  });

  @override
  Future call() async {
    try {
      appPresenter.navigateToRoute(route: CreateTaskScreen.tag);
    } catch (e) {
      rethrow;
    }
  }
}
