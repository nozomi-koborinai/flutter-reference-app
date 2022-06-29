import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/common_widgets/common_app_bar.dart';
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

    //ViewModelの初期化処理としてWidgetRefを渡してあげる
    _vm.init(ref);
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Post>> asyncValue = _vm.posts;

    return Scaffold(
      appBar: CommonAppBar(_vm.pageTitle),
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
