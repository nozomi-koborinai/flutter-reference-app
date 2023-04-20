import 'package:flutter/material.dart';
import 'package:flutter_reference_app/presentation/view_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// プレゼンテーション層の共通エラーハンドリングメソッドを備えたMixin
mixin ErrorHandlerMixin {
  Future<void> execute(
      BuildContext context, WidgetRef ref, Future<void> Function() action,
      {required String successMessage}) async {
    final viewUtils = ref.read(viewUtilsProvider);

    try {
      await action();
      viewUtils.showSnackBar(
        message: successMessage,
      );
    } catch (e) {
      viewUtils.showSnackBar(
        message: e.toString(),
        mode: SnackBarMode.failure,
      );
    }
  }
}
