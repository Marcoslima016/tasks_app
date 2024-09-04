import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/app/app.exports.dart';

class TwoButtonArea extends StatelessWidget {
  const TwoButtonArea({
    super.key,
    required this.onClickLeft,
    required this.onClickRight,
    required this.buttonLeftText,
    required this.buttonRightText,
  });

  final Future Function() onClickLeft;
  final Future Function() onClickRight;
  final String buttonLeftText;
  final String buttonRightText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Row(
        children: [
          SizedBox(
            child: ABoxButton.primary(
              active: true,
              onClick: onClickLeft,
              text: buttonLeftText,
            ),
          ),
          SizedBox(
            child: ABoxButton.primary(
              active: true,
              onClick: onClickLeft,
              text: buttonLeftText,
            ),
          ),
        ],
      ),
    );
  }
}

class SingleButtonArea extends StatelessWidget {
  const SingleButtonArea({
    super.key,
    required this.onClick,
    required this.buttonText,
  });

  final Future Function() onClick;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ABoxButton.primary(
        active: true,
        onClick: onClick,
        text: buttonText,
      ),
    );
  }
}

class AppDialog {
  late BuildContext context;

  final String? title;
  final String text;

  late final Widget widgetButtonsArea;

  late final bool _enableCloseButton;

  AppDialog.error({
    this.title = "Erro",
    required this.text,
  }) {
    widgetButtonsArea = SingleButtonArea(
      onClick: _closeDialog,
      buttonText: "Continuar",
    );
    _enableCloseButton = false;
  }

  AppDialog.message({
    required this.title,
    required this.text,
  }) {
    widgetButtonsArea = SingleButtonArea(
      onClick: _closeDialog,
      buttonText: "Continuar",
    );
    _enableCloseButton = false;
  }

  Future _closeDialog() async {
    Navigator.of(context).pop(false);
  }

  Future show({required BuildContext context}) async {
    return await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        this.context = context;

        return Dialog(
          insetPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0.2),
          child: Stack(
            children: [
              //OUT TAP
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(false);
                },
                child: Container(
                  width: 1.sw,
                  height: 2.sh,
                  color: Colors.transparent,
                ),
              ),

              //BODY
              body(),
            ],
          ),
        );
      },
    ).then((val) {
      return val;
    });
  }

  Widget body() {
    return SizedBox(
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 0.9.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(30.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //

                          AText.headingRegular(title!),

                          SizedBox(height: 18.h),

                          AText.bodyRegular(text),

                          Padding(
                            padding: EdgeInsets.only(top: 35.sp),
                            child: buttonsArea(),
                          ),
                        ],
                      ),
                      //
                    ],
                  ),
                ),
                _enableCloseButton
                    ? Positioned(
                        top: 8.5.sp,
                        right: 8.5.sp,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            size: 20.sp,
                            color: Colors.grey[500],
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonsArea() {
    return widgetButtonsArea;
  }
}
