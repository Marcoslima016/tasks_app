import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets.exports.dart';

class LoadingPopupController {
  late BuildContext? context;
  static final LoadingPopupController instance = LoadingPopupController._();
  LoadingPopupController._();

  setContext(BuildContext context) {
    this.context = context;
  }
}

class LoadingPopup {
  const LoadingPopup();

  Future hide() async {
    try {
      Navigator.pop(LoadingPopupController.instance.context!);
      await Future.delayed(const Duration(milliseconds: 100), () {});
    } catch (e) {
      rethrow;
    }
  }

  Future show({required BuildContext context}) async {
    LoadingPopupController.instance.setContext(context);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0.2),
          child: Stack(
            children: [
              _body(),
            ],
          ),
        );
      },
    ).then((val) {});
    await Future.delayed(const Duration(milliseconds: 350), () {});
  }

  Widget _body() {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ASpinner(),
        ],
      ),
    );
  }
}
