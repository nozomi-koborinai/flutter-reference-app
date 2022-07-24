import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/domain_layer/domain_providers.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/presentation_providers.dart';
import '../../domain_layer/interfaces/i_post_repository.dart';

/// PostPageViewModelのインスタンスを返却するプロバイダ
final postPageViewModelProvider = Provider<PostPageViewModel>((ref) {
  return PostPageViewModel(
      postRepository: ref.watch(postRepositoryProvider), ref: ref);
});

class PostPageViewModel {
  final IPostRepository postRepository;
  final ProviderRef ref;

  /// constructor
  /// ViewModelインスタンス化時にViewModel内で使用するRepositoryインスタンスをDI
  PostPageViewModel({required this.postRepository, required this.ref});

  // 各Providerのgetter（viewとのバインド用)
  String get pageTitle => ref.read(postTitleProvider).toString();
  String get contentLabel => ref.read(contentLabelProvider).toString();
  String get accountIdLabel => ref.read(accountIdLabelProvider).toString();
  TextEditingController get contentController => ref.read(contentControllerStateProvider.state).state;
  TextEditingController get accountIdController => ref.read(accountIdControllerStateProvider.state).state;

  /// 投稿ボタン押下時
  Future<void> onPost(BuildContext context) async {
    await addPost(Post(content: contentController.text, accountId: accountIdController.text));
    Navigator.pop(context);
  }

  /// 投稿コレクションにドキュメント追加
  Future<void> addPost(Post newPost) async => await postRepository.addPost(newPost);
}
