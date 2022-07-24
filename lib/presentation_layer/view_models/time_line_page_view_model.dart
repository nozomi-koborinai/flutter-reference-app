import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/domain_layer/domain_providers.dart';
import 'package:repository_riverpod_mvvm/domain_layer/interfaces/i_post_repository.dart';
import 'package:repository_riverpod_mvvm/infrastructure_layer/infrastructure_providers.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/presentation_providers.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/views/post_page.dart';

/// TimeLinePageViewModelのインスタンスを返却
final timeLinePageViewModelProvider = Provider<TimeLinePageViewModel>((ref) {
  return TimeLinePageViewModel(
      postRepository: ref.watch(postRepositoryProvider), ref: ref);
});

class TimeLinePageViewModel {
  final IPostRepository postRepository;
  final ProviderRef ref;

  //ViewModelインスタンス化時にViewModel内で使用するRepositoryインスタンスをDI
  TimeLinePageViewModel({required this.postRepository, required this.ref});

  //各Providerのgetter（viewとのバインド用）
  get pageTitle => ref.read(timeLineTitleProvider).toString();
  get posts => ref.watch(postListStreamProvider);

  /// 投稿ボタン押下時
  Future<void> onPost(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PostPage(),
      ),
    );
  }

  /// 削除ボタン押下時
  Future<void> onDelete(String id) async {
    await postRepository.deletePostFromId(id);
  }
}
