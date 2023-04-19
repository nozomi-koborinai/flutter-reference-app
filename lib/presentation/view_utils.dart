import 'package:flutter/material.dart';
import 'package:flutter_reference_app/presentation/components/failure_snackbar.dart';
import 'package:flutter_reference_app/presentation/components/success_snackbar.dart';

/// Viewに関するUtilityメソッド群
class ViewUtils {
  ViewUtils._();
  static final instance = ViewUtils._();

  /// スナックバー表示
  void showSnackBar({
    required BuildContext context,
    required String message,
    SnackBarMode mode = SnackBarMode.success,
  }) {
    final snackBar = mode == SnackBarMode.success
        ? SuccessSnackBar(message: message)
        : FailureSnackBar(message: message);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

/// スナックバー表示モード
enum SnackBarMode {
  /// 成功
  success,

  /// 失敗
  failure,
}
