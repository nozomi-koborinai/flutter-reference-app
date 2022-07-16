import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repository_riverpod_mvvm/domain_layer/domain_providers.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/post_page_view_model.dart';
import 'data/mock_post_repository.dart';
import 'data/test_providers.dart' as data;

final container = ProviderContainer(
  overrides: [
    postRepositoryProvider.overrideWithValue(MockPostRepository()),
  ],
);

void main() {
  final PostPageViewModel vm = container.read(data.postPageViewModelProvider);
  final MockPostRepository mockRepo = vm.postRepository as MockPostRepository;

  test('test', () async => {
    vm.contentController = TextEditingController(text: 'contentをセット'),
    vm.accountIdController = TextEditingController(text: 'accountIdをセット'),
    await vm.onPost(context: null),
    expect(mockRepo.data['0']!.accountId, 'accountIdをセット')
  });
}
