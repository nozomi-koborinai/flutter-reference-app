import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_layered_architecture/domain/models/post.dart';
import 'package:riverpod_layered_architecture/domain/repositories/post_repository.dart';

import 'mock_post_repository.dart';

void main() {
  final container = ProviderContainer(
    overrides: [
      postRepositoryProvider.overrideWithValue(MockPostRepository()),
    ],
  );
  group('postRepositoryProvider', () {
    final mockRepo = container.read(postRepositoryProvider);

    test('投稿データが追加されるはず', () async {
      await mockRepo.addPost(
        post: const Post(
          id: '0001',
          content: 'test1',
          contributor: 'account1',
        ),
      );
      await mockRepo.addPost(
        post: const Post(
          id: '0002',
          content: 'test2',
          contributor: 'account2',
        ),
      );
      final posts = (mockRepo as MockPostRepository).posts;
      expect(posts.length, 2);
      expect(posts.first.id, '0001');
      expect(posts.last.id, '0002');
    });
  });
}
