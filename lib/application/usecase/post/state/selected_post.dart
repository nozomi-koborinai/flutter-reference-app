import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/post/entity/post.dart';

/// 選択中投稿プロバイダー
final selectedPostProvider =
    NotifierProvider<SelectedPost, Post?>(SelectedPost.new);

/// 選択中の投稿を管理するためのクラス
class SelectedPost extends Notifier<Post?> {
  @override
  Post? build() {
    return null;
  }

  void set(Post? post) => state = post?.copyWith();
}
