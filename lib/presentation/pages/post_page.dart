import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_layered_architecture/application/post_service.dart';
import 'package:riverpod_layered_architecture/presentation/components/widget_ref.dart';

import '../../application/state/result.dart';
import '../../application/state/selected_post.dart';

class PostPage extends ConsumerWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 新規投稿結果を監視する
    ref.listenResult<void>(
      addPostResultProvider,
      completeMessage: '新規投稿しました',
      complete: (_) {
        Navigator.pop(context);
      },
    );

    // 投稿変更結果を監視する
    ref.listenResult<void>(
      updatePostResultProvider,
      completeMessage: '投稿内容を更新しました',
      complete: (_) {
        Navigator.pop(context);
      },
    );

    final selectedPost = ref.read(selectedPostProvider);

    final contentController =
        TextEditingController(text: selectedPost?.content);
    final contributorController =
        TextEditingController(text: selectedPost?.contributor);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPost == null ? '投稿' : '編集'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: contentController,
                  enabled: true,
                  style: const TextStyle(color: Colors.black),
                  obscureText: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    labelText: 'content',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: contributorController,
                  enabled: true,
                  style: const TextStyle(color: Colors.black),
                  obscureText: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    labelText: 'contributor',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (selectedPost == null) {
                    await ref.read(postServiceProvider).addPost(
                          content: contentController.text,
                          contributor: contributorController.text,
                        );
                  } else {
                    await ref.read(postServiceProvider).updatePost(
                          id: selectedPost.id!,
                          content: contentController.text,
                          contributor: contributorController.text,
                        );
                  }
                },
                child: Text(selectedPost == null ? '投稿' : '保存'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
