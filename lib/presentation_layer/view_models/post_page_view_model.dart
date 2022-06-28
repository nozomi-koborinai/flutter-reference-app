import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';

import '../../domain_layer/interfaces/i_post_repository.dart';

class PostPageViewModel {
  late WidgetRef _ref;
  final IPostRepository postRepository;

  //providers
  final titleProvider = Provider<String>((ref) => '投稿');

  //constructor
  //ViewModelインスタンス化時にViewModel内で使用するRepositoryインスタンスをDI
  PostPageViewModel(this.postRepository);

  //初期化
  //view側からWidgetRefをもらう
  void init(WidgetRef ref) {
    _ref = ref;
  }

  ///各Providerのgetter
  get pageTitle => _ref.watch(titleProvider).toString();

  //投稿ボタン押下時
  Future<void> onPost(BuildContext context) async {
    Navigator.pop(context);

    //ここはテストだから後で消す
    // await postRepository.addPost(const Post('6', '投稿したぜ', 'flutter'));
  }
}
