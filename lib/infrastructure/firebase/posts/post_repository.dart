import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/models/post.dart';
import '../../../domain/repositories/post_repository.dart';
import 'documents/post_document.dart';

/// Firebase 投稿リポジトリ
class FirebasePostRepository implements IPostRepository {
  FirebasePostRepository({required this.collectionRef});
  final CollectionReference<PostDocument> collectionRef;

  /// Create：投稿新規追加
  @override
  Future<void> addPost({required Post post}) async {
    await collectionRef.add(
      PostDocument(
        content: post.content,
        contributor: post.contributor,
      ),
    );
  }

  // Read：postsコレクションの全ドキュメントをStreamとして取得
  @override
  Stream<List<Post>> streamAllPosts() {
    // TODO:ソート対象をcreatedAtにする
    return collectionRef.orderBy('content', descending: false).snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Post(
                  id: doc.id,
                  content: doc.data().content,
                  contributor: doc.data().contributor,
                ),
              )
              .toList(),
        );
  }

  /// Update：postコレクション.documentIdに紐づく投稿を更新
  @override
  Future<void> updatePost({required Post post}) async {
    await collectionRef.doc(post.id).update(
          PostDocument(
            content: post.content,
            contributor: post.contributor,
          ).toJson(),
        );
  }

  /// Delete：postコレクション.documentIdをに紐づく投稿を削除
  @override
  Future<void> deletePostFromId({required String docId}) async {
    collectionRef.doc(docId).delete();
  }

  @override
  void dispose() {
    // 本クラスでは特別後始末が必要なものは無し
  }
}
