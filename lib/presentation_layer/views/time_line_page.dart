import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/common_widgets/common_app_bar.dart';
import 'package:repository_riverpod_mvvm/domain_layer/providers.dart';

import '../../domain_layer/models/post.dart';

class TimeLinePage extends ConsumerWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(timeLinePageViewModelProvider);
    vm.init(ref);
    final AsyncValue<List<Post>> asyncValue = vm.posts;

    return Scaffold(
      appBar: CommonAppBar(vm.pageTitle),
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
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
