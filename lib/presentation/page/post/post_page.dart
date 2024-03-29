import 'package:flutter/material.dart';
import 'package:flutter_reference_app/presentation/page/post/component/post_button.dart';
import 'package:flutter_reference_app/presentation/page/post/component/post_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/usecase/post/state/selected_post.dart';

class PostPage extends ConsumerWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 選択中投稿情報を取得する
    final selectedPost = ref.read(selectedPostProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPost == null ? '投稿' : '編集'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
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
