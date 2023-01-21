import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/post.dart';

/// 選択中投稿プロバイダー
final selectedPostProvider = StateProvider<Post?>(
  (_) => null,
);
