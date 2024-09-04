import '../domain.exports.dart';

abstract class IValidateFormOnInputUpdate {
  Future<bool> call();
}

class ValidateFormOnInputUpdate implements IValidateFormOnInputUpdate {
  final CreateTaskScreenPresenter createTaskScreenPresenter;

  ValidateFormOnInputUpdate({
    required this.createTaskScreenPresenter,
  });

  @override
  Future<bool> call() async {
    if (createTaskScreenPresenter.getInputTitleText != "") {
      return true;
    } else {
      return false;
    }
  }
}
