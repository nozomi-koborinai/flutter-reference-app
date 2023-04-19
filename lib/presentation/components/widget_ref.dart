import 'package:flutter/material.dart';
import 'package:flutter_reference_app/presentation/components/error_message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dialog.dart';
import 'loading.dart';
import 'scaffold_messenger.dart';

extension WidgetRefEx on WidgetRef {
  /// XXXResultProviderを良い感じに処理する
  void listenResult<T>(
    ProviderListenable<AsyncValue<T>> resultProvider, {
    void Function(T data)? complete,
    bool loading = true,
    String? completeMessage,
  }) {
    listen<AsyncValue<T>>(
      resultProvider,
      (previous, next) async {
        if (next.isLoading) {
          // 処理中
          if (loading) {
            read(overlayLoadingProvider.notifier).update((_) => true);
          }
          return;
        }
        await next.when(
          data: (data) async {
            // 処理完了
            read(overlayLoadingProvider.notifier).update((_) => false);
            if (completeMessage != null) {
              // 完了メッセージがあれば SnackBar を表示する
              final messengerState =
                  read(scaffoldMessengerKeyProvider).currentState;
              messengerState?.showSnackBar(
                SnackBar(
                  content: Text(completeMessage),
                ),
              );
            }
            complete?.call(data);
          },
          error: (e, s) async {
            // エラーが発生したのでエラーダイアログを表示する
            read(overlayLoadingProvider.notifier).update((_) => false);
            await showDialog<void>(
              context: read(navigatorKeyProvider).currentContext!,
              builder: (context) => ErrorDialog(
                message: e.errorMessage,
              ),
            );
          },
          loading: () {
            // 処理中
            if (loading) {
              read(overlayLoadingProvider.notifier).update((_) => true);
            }
          },
        );
      },
    );
  }
}
