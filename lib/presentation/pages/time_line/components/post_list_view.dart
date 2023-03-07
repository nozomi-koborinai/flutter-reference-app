import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../application/post_service.dart';
import '../../../../application/state/selected_post.dart';
import '../../../../domain/models/post.dart';
import '../../../../domain/repositories/post_repository.dart';
import '../../../components/async_value_handler.dart';
import '../../post/post_page.dart';

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
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostPage(),
                  ),
                );
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
                    onPressed: () => ref
                        .read(postServiceProvider)
                        .deletePost(id: posts[index].id!),
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
