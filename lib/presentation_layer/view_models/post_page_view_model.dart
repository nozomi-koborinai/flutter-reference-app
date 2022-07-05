import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/presentation_providers.dart';
import '../../domain_layer/interfaces/i_post_repository.dart';

class PostPageViewModel {
  final IPostRepository postRepository;
  final ProviderRef ref;

  //constructor
  //ViewModelインスタンス化時にViewModel内で使用するRepositoryインスタンスをDI
  PostPageViewModel({required this.postRepository, required this.ref});

  //各Providerのgetter（viewとのバインド用)
  get pageTitle => ref.watch(postTitleProvider).toString();
  get contentLabel => ref.watch(contentLabelProvider).toString();
  get accountIdLabel => ref.watch(accountIdLabelProvider).toString();
  get contentController =>
      ref.watch(contentControllerStateProvider.state).state;
  get accountIdController =>
      ref.watch(accountIdControllerStateProvider.state).state;

  //投稿ボタン押下時
  Future<void> onPost(BuildContext context) async {
    await postRepository
        .addPost(Post(contentController.text, accountIdController.text));
    Navigator.pop(context);
  }
}
