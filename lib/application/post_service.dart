import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 投稿サービスプロバイダー
final postServiceProvider = Provider(
  PostService.new,
);

/// 投稿サービス
///
/// 投稿に関する操作を提供する
/// Widget から呼ばれ、各 Repository や State を操作するロジックを実装する
class PostService {
  const PostService(this.ref);
  final Ref ref;
}
