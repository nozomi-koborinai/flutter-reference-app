import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:riverpod_layered_architecture/application/post_service.dart';
import 'package:riverpod_layered_architecture/domain/repositories/post_repository.dart';
import 'package:riverpod_layered_architecture/presentation/components/async_value_handler.dart';
import 'package:riverpod_layered_architecture/presentation/pages/post_page.dart';

import '../../domain/models/post.dart';

class TimeLinePage extends ConsumerWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('投稿')),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.chat_bubble_outline_outlined),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PostPage()),
            );
          }),
      body: AsyncValueHandler(
        value: ref.watch(postsProvider),
        builder: (List<Post> posts) {
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const CircleAvatar(
                      child: Icon(Icons.face_retouching_natural_sharp)),
                  title: Text(posts[index].content),
                  subtitle: Text(posts[index].contributor),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: HexColor('#696969')),
                    onPressed: () => ref
                        .read(postServiceProvider)
                        .deletePost(id: posts[index].id!),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
