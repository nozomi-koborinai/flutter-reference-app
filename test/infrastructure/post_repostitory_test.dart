import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repository_riverpod_mvvm/domain/domain_providers.dart';
import 'package:repository_riverpod_mvvm/domain/models/post.dart';
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
      await mockRepo.addPost(const Post(id: '0001', content: 'test1', accountId: 'account1'));
      await mockRepo.addPost(const Post(id: '0002', content: 'test2', accountId: 'account2'));
      final posts = (mockRepo as MockPostRepository).posts;
      expect(posts.length, 2);
      expect(posts.first.id, '0001');
      expect(posts.last.id, '0002');
    });
    test('0001のPostデータが取得されるはず', () async {
      final fetchPost =  await  mockRepo.fetchPostFromUserId('0001');
        expect(fetchPost.length, 1);
        expect(fetchPost.first.content, 'test1');
      });
    });
  }
