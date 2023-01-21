import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/post.dart';
import '../view_models/time_line_page_view_model.dart';

class TimeLinePage extends ConsumerWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(timeLinePageViewModelProvider);
    final AsyncValue<List<Post>> asyncValue = vm.posts;

    return Scaffold(
      appBar: AppBar(title: const Text('投稿')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.chat_bubble_outline_outlined),
        onPressed: () => vm.onPost(context),
      ),
      body: Center(
        child: asyncValue.when(
            error: (e, stackTrace) => Text(e.toString()),
            loading: () => const CircularProgressIndicator(),
            data: (List<Post> data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (content, index) {
                  return Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                          child: Icon(Icons.face_retouching_natural_sharp)),
                      title: Text(data[index].content),
                      subtitle: Text(data[index].accountId),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => vm.onDelete(data[index].id!),
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
