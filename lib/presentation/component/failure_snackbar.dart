import 'package:flutter/material.dart';

/// 処理失敗(エラー)用のスナックバー
class FailureSnackBar extends SnackBar {
  FailureSnackBar._({required String message})
      : super(
          content: Text(message),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        );

  static void show(
    ScaffoldMessengerState scaffoldMessenger, {
    required String message,
  }) {
    scaffoldMessenger.showSnackBar(FailureSnackBar._(message: message));
  }
}
