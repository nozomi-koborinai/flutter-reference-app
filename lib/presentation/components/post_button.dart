import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_layered_architecture/presentation/components/post_text_form_field.dart';
import 'package:riverpod_layered_architecture/presentation/pages/post_page.dart';

import '../../application/post_service.dart';

class PostButton extends ConsumerWidget {
  const PostButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPost = ref.read(selectedPostProvider);
    final contentController = ref.watch(contentControllerProvider);
    final contributorController = ref.watch(contributorControllerProvider);

    return ElevatedButton(
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
    );
  }
}
