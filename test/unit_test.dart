import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repository_riverpod_mvvm/domain_layer/domain_providers.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/post_page_view_model.dart';
import 'data/mock_post_repository.dart';

final container = ProviderContainer(
  overrides: [
    postRepositoryProvider.overrideWithValue(MockPostRepository()),
  ],
);

void main() {
  final PostPageViewModel vm = container.read(postPageViewModelProvider);
  final MockPostRepository mockRepo = vm.postRepository as MockPostRepository;

  test('投稿ボタン押下時', () async => {
    await vm.addPost(const Post(content: 'contentです', accountId: 'accountIdです')),
    expect(mockRepo.data['0']!.accountId, 'accountIdです')
  });
}
