import 'package:flutter/material.dart';
import 'package:flutter_reference_app/presentation/pages/post/components/post_text_form_field.dart';
import 'package:flutter_reference_app/presentation/view_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../application/post/post_service.dart';
import '../../../../application/state/selected_post.dart';
import '../../../router_config.dart';

class PostButton extends ConsumerWidget {
  const PostButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPost = ref.read(selectedPostProvider);
    final contentController = ref.watch(contentControllerProvider);
    final contributorController = ref.watch(contributorControllerProvider);

    return ElevatedButton(
      onPressed: () async {
        final viewUtils = ref.read(viewUtilsProvider);
        if (selectedPost == null) {
          try {
            await ref.read(postServiceProvider).addPost(
                  content: contentController.text,
                  contributor: contributorController.text,
                );
            viewUtils.showSnackBar(
              message: '新規投稿しました',
            );
          } catch (e) {
            viewUtils.showSnackBar(
              message: e.toString(),
              mode: SnackBarMode.failure,
            );
          }
        } else {
          try {
            await ref.read(postServiceProvider).updatePost(
                  id: selectedPost.id!,
                  content: contentController.text,
                  contributor: contributorController.text,
                );
            viewUtils.showSnackBar(
              message: '投稿内容を編集しました',
            );
          } catch (e) {
            viewUtils.showSnackBar(
              message: e.toString(),
              mode: SnackBarMode.failure,
            );
          }
        }
        context.goNamed(RouteConfigs.timeLine.name);
      },
      child: Text(selectedPost == null ? '投稿' : '保存'),
    );
  }
}
