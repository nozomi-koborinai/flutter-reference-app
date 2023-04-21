import 'package:flutter/material.dart';
import 'package:flutter_reference_app/domain/post/usecase/post_usecase.dart';
import 'package:flutter_reference_app/presentation/pages/post/components/post_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../usecase/state/selected_post.dart';
import '../../../error_handler_mixin.dart';
import '../../../router_config.dart';

class PostButton extends ConsumerWidget with ErrorHandlerMixin {
  const PostButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPost = ref.read(selectedPostProvider);
    final contentController = ref.watch(contentControllerProvider);
    final contributorController = ref.watch(contributorControllerProvider);

    return ElevatedButton(
      onPressed: () async {
        final postUsecase = ref.read(postUsecaseProvider);
        final successMessage =
            selectedPost == null ? '新規投稿しました' : '投稿内容を編集しました';
        final action = selectedPost == null
            ? () => postUsecase.addPost(
                  content: contentController.text,
                  contributor: contributorController.text,
                )
            : () => postUsecase.updatePost(
                  id: selectedPost.id!,
                  content: contentController.text,
                  contributor: contributorController.text,
                );
        await execute(
          context,
          ref,
          action,
          successMessage: successMessage,
        );
        context.goNamed(RouteConfigs.timeLine.name);
      },
      child: Text(selectedPost == null ? '投稿' : '保存'),
    );
  }
}
