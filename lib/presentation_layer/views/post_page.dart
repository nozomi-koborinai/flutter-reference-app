import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/main.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/post_page_view_model.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/time_line_page_view_model.dart';

import '../../domain_layer/models/post.dart';

class PostPage extends ConsumerStatefulWidget {
  PostPageViewModel vm;
  PostPage(this.vm, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostPageState();
}

class _PostPageState extends ConsumerState<PostPage> {
  late PostPageViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = widget.vm;
    _vm.init(ref);
  }

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
