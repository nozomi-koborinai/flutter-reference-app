import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/main.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/time_line_page_view_model.dart';

import '../../domain_layer/models/post.dart';

class TimeLinePage extends ConsumerStatefulWidget {
  TimeLinePageViewModel vm;
  TimeLinePage(this.vm, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends ConsumerState<TimeLinePage> {
  late TimeLinePageViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = widget.vm;
    _vm.init(ref);
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Post>> asyncValue = _vm.posts;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _vm.pageTitle,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 2,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.chat_bubble_outline_outlined),
        onPressed: () => _vm.onPost(context),
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
                      leading: const CircleAvatar(child: Icon(Icons.face)),
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
