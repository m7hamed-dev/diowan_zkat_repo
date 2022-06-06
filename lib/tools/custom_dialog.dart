import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/txt.dart';

class CustomDialog {
  ///
  static Future dialog(BuildContext context, Widget title, Widget content) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: title,
            content: content,
          );
        });
  }

  /// loading
  static Future loadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Txt(data: 'من فضلك انتظر'),
              SizedBox(width: 20.0),
              CupertinoActivityIndicator(),
            ],
          ),
        );
      },
    );
  }

  /// clsoe
  static void closeDialog(BuildContext context) => Navigator.pop(context);
}
