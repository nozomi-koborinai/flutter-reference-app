import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/post/entity/post.dart';
import '../../../domain/post/post_repository.dart';
import '../firebase_providers.dart';
import 'document/post_document.dart';

/// 投稿コレクション参照プロバイダー
final postCollectionRefProvider = Provider(
  (ref) => ref
      .watch(firebaseFirestoreProvider)
      .collection('post')
      .withConverter<PostDocument>(
        fromFirestore: (snapshot, _) => PostDocument.fromJson(snapshot.data()!),
        toFirestore: (postDoc, options) => postDoc.toJson(),
      ),
);

/// Firebase 投稿リポジトリ
class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({required this.collectionRef});
  final CollectionReference<PostDocument> collectionRef;

  /// Create：投稿新規追加
  @override
  Future<void> addPost({required Post post}) async {
    try {
      await collectionRef.add(
        PostDocument(
          content: post.content,
          contributor: post.contributor,
        ),
      );
    } on FirebaseException catch (e) {
      throw ('Firestore の追加処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw ('予期しないエラーが発生しました: $e');
    }
  }

  // Read：postsコレクションの全ドキュメントをStreamとして取得
  @override
  Stream<List<Post>> streamAllPosts() {
    try {
      // TODO:ソート対象をcreatedAtにする
      return collectionRef
          .orderBy('content', descending: false)
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map(
                  (doc) => doc.data().toPost(id: doc.id),
                )
                .toList(),
          );
    } on FirebaseException catch (e) {
      throw ('Firestore の読取処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw ('予期しないエラーが発生しました: $e');
    }
  }

  /// Update：postコレクション.documentIdに紐づく投稿を更新
  @override
  Future<void> updatePost({required Post post}) async {
    try {
      await collectionRef.doc(post.id).update(
            PostDocument(
              content: post.content,
              contributor: post.contributor,
            ).toJson(),
          );
    } on FirebaseException catch (e) {
      throw ('Firestore の更新処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw ('予期しないエラーが発生しました: $e');
    }
  }

  /// Delete：postコレクション.documentIdをに紐づく投稿を削除
  @override
  Future<void> deletePostFromId({required String docId}) async {
    try {
      collectionRef.doc(docId).delete();
    } on FirebaseException catch (e) {
      throw ('Firestore の削除処理でエラーが発生しました: ${e.code}');
    } catch (e) {
      throw ('予期しないエラーが発生しました: $e');
    }
  }

  @override
  void dispose() {
    // 本クラスでは特別後始末が必要なものは無し
  }
}

extension on PostDocument {
  /// PostDocument => Post
  Post toPost({required String id}) {
    return Post(
      content: content,
      contributor: contributor,
      id: id,
    );
  }
}
