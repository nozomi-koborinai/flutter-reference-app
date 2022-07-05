import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/data_layer/infrastructure_providers.dart';
import 'package:repository_riverpod_mvvm/domain_layer/interfaces/i_post_repository.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/presentation_providers.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/views/post_page.dart';

class TimeLinePageViewModel {
  late WidgetRef _ref;
  final IPostRepository postRepository;

  //ViewModelインスタンス化時にViewModel内で使用するRepositoryインスタンスをDI
  TimeLinePageViewModel(this.postRepository);

  //初期化
  //view側からWidgetRefをもらう
  void init(WidgetRef ref) {
    _ref = ref;
  }

  //各Providerのgetter（viewとのバインド用）
  get pageTitle => _ref.watch(timeLineTitleProvider).toString();
  get posts => _ref.watch(postListStreamProvider);

  ///投稿ボタン押下時
  Future<void> onPost(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PostPage(),
      ),
    );
  }
}
