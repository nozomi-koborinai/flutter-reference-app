import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/components/loading.dart';

/// ユースケース実行のためのメソッドを備えた Mixin
mixin RunUsecaseMixin {
  Future<T> execute<T>(ProviderRef ref, Future<T> Function() action) async {
    ref.read(overlayLoadingProvider.notifier).update((_) => true);
    try {
      return await action();
    } catch (e) {
      rethrow;
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((_) => false);
    }
  }
}
