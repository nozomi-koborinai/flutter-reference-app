import 'package:flutter/material.dart';
import 'package:flutter_reference_app/domain/app_exception.dart';

import 'component/failure_snackbar.dart';
import 'component/success_snackbar.dart';

/// プレゼンテーション層の共通エラーハンドリングメソッドを備えたMixin
mixin ErrorHandlerMixin {
  Future<void> execute(
    BuildContext context,
    Future<void> Function() action, {
    required String successMessage,
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await action();
      SuccessSnackBar.show(
        scaffoldMessenger,
        message: successMessage,
      );
    } on AppException catch (e) {
      FailureSnackBar.show(
        scaffoldMessenger,
        message: e.toString(),
      );
    }
  }
}
