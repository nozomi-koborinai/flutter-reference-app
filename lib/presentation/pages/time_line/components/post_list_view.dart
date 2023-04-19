import 'package:flutter/material.dart';
import 'package:flutter_reference_app/presentation/router_config.dart';
import 'package:flutter_reference_app/presentation/view_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../application/post_service.dart';
import '../../../../application/state/selected_post.dart';
import '../../../../domain/models/post.dart';
import '../../../../domain/repositories/post_repository.dart';
import '../../../components/async_value_handler.dart';

/// 投稿一覧リスト
class PostListView extends ConsumerWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueHandler(
      value: ref.watch(postsProvider),
      builder: (List<Post> posts) {
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
                        final viewUtils = ref.read(viewUtilsProvider);
                        try {
                          await ref
                              .read(postServiceProvider)
                              .deletePost(id: posts[index].id!);
                          viewUtils.showSnackBar(
                            message: '投稿を削除しました',
                          );
                        } catch (e) {
                          viewUtils.showSnackBar(
                            message: e.toString(),
                            mode: SnackBarMode.failure,
                          );
                        }
                      }),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
