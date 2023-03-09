import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_reference_app/application/state/result.dart';
import 'package:flutter_reference_app/presentation/components/widget_ref.dart';
import 'package:flutter_reference_app/presentation/pages/time_line/components/post_list_view.dart';
import 'package:flutter_reference_app/presentation/router_config.dart';

import '../../../application/state/selected_post.dart';

/// タイムライン（投稿一覧）ページ
class TimeLinePage extends ConsumerWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 投稿削除結果を監視する
    ref.listenResult<void>(
      deletePostResultProvider,
      completeMessage: '投稿を削除しました',
    );

    return Scaffold(
      appBar: AppBar(title: const Text('タイムライン')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.chat_bubble_outline_outlined),
        onPressed: () async {
          ref.read(selectedPostProvider.notifier).set(null);
          context.goNamed(RouteConfigs.post.name);
        },
      ),
      body: const PostListView(),
    );
  }
}
