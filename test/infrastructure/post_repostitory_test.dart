import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_reference_app/domain/models/post.dart';
import 'package:flutter_reference_app/domain/repositories/post_repository.dart';

import '../test_agent.dart';
import 'mocks/mock_post_repository.dart';

void main() {
  final agent = TestAgent();

  /// 毎回テストケースを実行するたびに最初に呼ばれる処理
  setUp(agent.setUp);

  group('postRepositoryのテスト:初期化時', () {
    test('全投稿数の初期値は5件であること', () async {
      final repository =
          agent.container.read(postRepositoryProvider) as MockPostRepository;
      expect(repository.posts.length, 5);
    });
  });

  group('postRepositoryのテスト:新規投稿追加時', () {
    test('新規投稿したら全投稿数が１件増えること', () async {
      final repository =
          agent.container.read(postRepositoryProvider) as MockPostRepository;
      repository.addPost(
        post: const Post(
          id: '006',
          content: '投稿6',
          contributor: '投稿者6',
        ),
      );
      expect(repository.posts.length, 6);
      expect(repository.posts.where((p) => p.id == '006').length, 1);
    });
  });

  group('postRepositoryのテスト:投稿編集時', () {
    test('id=005の投稿情報を変更できること', () async {
      final repository =
          agent.container.read(postRepositoryProvider) as MockPostRepository;
      repository.updatePost(
        post: const Post(
          id: '005',
          content: '投稿5を更新',
          contributor: '投稿者5を更新',
        ),
      );
      expect(repository.posts.length, 5);

      // 更新後情報の取得
      final newPost = repository.posts.firstWhere((p) => p.id == '005');
      expect(newPost.content, '投稿5を更新');
      expect(newPost.contributor, '投稿者5を更新');
    });
  });

  group('postRepositoryのテスト:投稿削除時', () {
    test('id=005の投稿情報を削除できること', () async {
      final repository =
          agent.container.read(postRepositoryProvider) as MockPostRepository;
      expect(repository.posts.length, 5);
      repository.deletePostFromId(docId: '005');
      expect(repository.posts.length, 4);
      expect(repository.posts.where((post) => post.id == '005').length, 0);
    });
  });

  group('postRepositoryのテスト:全件取得時', () {
    test('投稿が全件取得できること', () async {
      final repository =
          agent.container.read(postRepositoryProvider) as MockPostRepository;
      repository.addPost(
        post: const Post(
          id: '006',
          content: '投稿6',
          contributor: '投稿者6',
        ),
      );
      final postsStream = repository.streamAllPosts();
      await for (final posts in postsStream) {
        expect(posts.length, 6);
        expect(posts[0].id, '001');
        expect(posts[0].content, '投稿1');
        expect(posts[0].contributor, '投稿者1');
        expect(posts[1].id, '002');
        expect(posts[1].content, '投稿2');
        expect(posts[1].contributor, '投稿者2');
        expect(posts[2].id, '003');
        expect(posts[2].content, '投稿3');
        expect(posts[2].contributor, '投稿者3');
        expect(posts[3].id, '004');
        expect(posts[3].content, '投稿4');
        expect(posts[3].contributor, '投稿者4');
        expect(posts[4].id, '005');
        expect(posts[4].content, '投稿5');
        expect(posts[4].contributor, '投稿者5');
        expect(posts[5].id, '006');
        expect(posts[5].content, '投稿6');
        expect(posts[5].contributor, '投稿者6');
      }
    });
  });
}
