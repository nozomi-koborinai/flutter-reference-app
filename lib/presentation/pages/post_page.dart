import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_layered_architecture/application/post_service.dart';

import '../../application/state/selected_post.dart';

class PostPage extends ConsumerWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPost = ref.read(selectedPostProvider);

    TextEditingController contentController =
        TextEditingController(text: selectedPost?.content);
    TextEditingController contributorController =
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
                  Navigator.pop(context);
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
