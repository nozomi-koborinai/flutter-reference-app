import 'package:flutter/material.dart';
import 'package:flutter_reference_app/presentation/components/widget_ref.dart';
import 'package:flutter_reference_app/presentation/pages/post/components/post_button.dart';
import 'package:flutter_reference_app/presentation/pages/post/components/post_text_form_field.dart';
import 'package:flutter_reference_app/presentation/router_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../application/state/result.dart';
import '../../../application/state/selected_post.dart';

class PostPage extends ConsumerWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 新規投稿結果を監視する
    ref.listenResult<void>(
      addPostResultProvider,
      completeMessage: '新規投稿しました',
      complete: (_) {
        context.goNamed(RouteConfigs.timeLine.name);
      },
    );

    // 投稿変更結果を監視する
    ref.listenResult<void>(
      updatePostResultProvider,
      completeMessage: '投稿内容を更新しました',
      complete: (_) {
        context.goNamed(RouteConfigs.timeLine.name);
      },
    );

    // 選択中投稿情報を取得する
    final selectedPost = ref.read(selectedPostProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPost == null ? '投稿' : '編集'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: PostContentTextFormField(),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: PostContributorTextFormField(),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: PostButton(),
            )
          ],
        ),
      ),
    );
  }
}
