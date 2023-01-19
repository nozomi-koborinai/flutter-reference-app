import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_layered_architecture/infrastructure/firebase/posts/dtos/post_document.dart';

import '../../../domain/interfaces/i_post_repository.dart';
import '../../../domain/models/post.dart';
import '../firebase_providers.dart';

/// 投稿コレクション参照プロバイダー
final postsCollectionRefProvider = Provider(
  (ref) => ref
      .watch(firebaseFirestoreProvider)
      .collection('posts')
      .withConverter<PostDocument>(
        fromFirestore: (snapshot, _) => PostDocument.fromJson(snapshot.data()!),
        toFirestore: (postDoc, options) => postDoc.toJson(),
      ),
);

/// Firebase 投稿リポジトリ
class FirebasePostRepository implements IPostRepository {
  FirebasePostRepository({
    required this.collectionRef,
  });

  final CollectionReference<PostDocument> collectionRef;

  /// 投稿新規追加
  @override
  Future<void> addPost(Post newPost) async {
    await collectionRef.add(
      PostDocument(
        content: newPost.content,
        accountId: newPost.accountId,
      ),
    );
  }

  /// 投稿IDを元に投稿ドキュメント削除
  @override
  Future<void> deletePostFromId(String id) async =>
      collectionRef.doc(id).delete();

  /// ユーザIdに紐づく投稿情報を取得
  @override
  Future<List<Post>> fetchPostFromUserId(String id) async {
    throw UnimplementedError();
  }
}
