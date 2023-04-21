import 'package:flutter/material.dart';
import 'package:flutter_reference_app/presentation/page/time_line/component/post_list_view.dart';
import 'package:flutter_reference_app/presentation/router_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../usecase/state/selected_post.dart';

/// タイムライン（投稿一覧）ページ
class TimeLinePage extends ConsumerWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
