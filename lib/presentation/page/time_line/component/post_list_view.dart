import 'package:flutter/material.dart';
import 'package:flutter_reference_app/presentation/component/loading.dart';
import 'package:flutter_reference_app/presentation/error_handler_mixin.dart';
import 'package:flutter_reference_app/presentation/router_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../application/usecase/post/post_usecase.dart';
import '../../../../application/usecase/post/state/posts.dart';
import '../../../../application/usecase/post/state/selected_post.dart';

/// 投稿一覧リスト
class PostListView extends ConsumerWidget with ErrorHandlerMixin {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(postsProvider);
    return postsAsyncValue.when(
      loading: () {
        return const OverlayLoading();
      },
      error: (error, stack) => Center(child: Text('$error')),
      data: (posts) {
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () async {
                ref.read(selectedPostProvider.notifier).set(posts[index]);
                context.goNamed(RouteConfigs.post.name);
              },
              child: Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.face_retouching_natural_sharp),
                  ),
                  title: Text(posts[index].content),
                  subtitle: Text(posts[index].contributor),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: HexColor('#696969'),
                    ),
                    onPressed: () async {
                      execute(
                        context,
                        () => ref
                            .read(postUsecaseProvider)
                            .deletePost(id: posts[index].id!),
                        successMessage: '投稿を削除しました',
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
