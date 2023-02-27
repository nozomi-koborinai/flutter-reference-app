import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_layered_architecture/application/state/result.dart';
import 'package:riverpod_layered_architecture/presentation/components/widget_ref.dart';
import 'package:riverpod_layered_architecture/presentation/pages/post/post_page.dart';
import 'package:riverpod_layered_architecture/presentation/pages/time_line/components/post_list_view.dart';

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
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PostPage()),
              );
            }),
        body: const PostListView());
  }
}
