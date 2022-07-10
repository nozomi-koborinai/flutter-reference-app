import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/domain_layer/domain_providers.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/post_page_view_model.dart';

/// テスト用PostRepositoryをDIした投稿ページVMのプロバイダ
final postPageViewModelProvider = Provider<PostPageViewModel>((ref) =>
    PostPageViewModel(
        postRepository: ref.watch(postRepositoryProvider), ref: ref));