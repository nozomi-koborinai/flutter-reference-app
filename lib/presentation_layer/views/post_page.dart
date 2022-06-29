import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/common_widgets/common_app_bar.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/post_page_view_model.dart';

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

    //ViewModelの初期化処理としてWidgetRefを渡してあげる
    _vm.init(ref);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(_vm.pageTitle),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: _vm.contentController,
                  enabled: true,
                  style: const TextStyle(color: Colors.black),
                  obscureText: false,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: _vm.contentLabel,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: _vm.accountIdController,
                  enabled: true,
                  style: const TextStyle(color: Colors.black),
                  obscureText: false,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: _vm.accountIdLabel,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => _vm.onPost(context,
                      _vm.contentController.text, _vm.accountIdController.text),
                  child: Text(_vm.pageTitle)),
            )
          ],
        ),
      ),
    );
  }
}
