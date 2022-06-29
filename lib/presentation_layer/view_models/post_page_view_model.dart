import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';
import '../../domain_layer/interfaces/i_post_repository.dart';

//providers
final titleProvider = Provider<String>((ref) => '投稿');
final contentLabelProvider = Provider<String>((ref) => 'content');
final accountIdLabelProvider = Provider<String>((ref) => 'AccountId');
final contentControllerStateProvider =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));
final accountIdControllerStateProvider =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));

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
  get pageTitle => _ref.watch(titleProvider).toString();
  get contentLabel => _ref.watch(contentLabelProvider).toString();
  get accountIdLabel => _ref.watch(accountIdLabelProvider).toString();
  get contentController =>
      _ref.watch(contentControllerStateProvider.state).state;
  get accountIdController =>
      _ref.watch(accountIdControllerStateProvider.state).state;

  //投稿ボタン押下時
  Future<void> onPost(
      BuildContext context, String content, String accountId) async {
    await postRepository.addPost(Post(content, accountId));
    Navigator.pop(context);
  }
}
