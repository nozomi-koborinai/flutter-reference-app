import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/presentation_providers.dart';
import '../../domain_layer/interfaces/i_post_repository.dart';

class PostPageViewModel {
  late WidgetRef _ref;
  final IPostRepository postRepository;

  //constructor
  //ViewModelインスタンス化時にViewModel内で使用するRepositoryインスタンスをDI
  PostPageViewModel(this.postRepository);

  //初期化
  //view側からWidgetRefをもらう
  void init(WidgetRef ref) {
    _ref = ref;
  }

  //各Providerのgetter（viewとのバインド用)
  get pageTitle => _ref.watch(postTitleProvider).toString();
  get contentLabel => _ref.watch(contentLabelProvider).toString();
  get accountIdLabel => _ref.watch(accountIdLabelProvider).toString();
  get contentController =>
      _ref.watch(contentControllerStateProvider.state).state;
  get accountIdController =>
      _ref.watch(accountIdControllerStateProvider.state).state;

  //投稿ボタン押下時
  Future<void> onPost(BuildContext context) async {
    await postRepository
        .addPost(Post(contentController.text, accountIdController.text));
    Navigator.pop(context);
  }
}
