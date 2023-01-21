import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/post.dart';
import '../../../domain/repository_interfaces/i_post_repository.dart';
import '../firebase_providers.dart';
import 'documents/post_document.dart';

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

  final _postsStreamController = StreamController<List<Post>>.broadcast();

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

  /// Read：postコレクション.documentIdに紐づく投稿を取得
  @override
  Stream<List<Post>> fetchPosts() {
    return _postsStreamController.stream;
  }

  /// Update：postコレクション.documentIdに紐づく投稿を更新
  @override
  Future<void> updatePost({required Post post}) async {}

  /// Delete：postコレクション.documentIdをに紐づく投稿を削除
  @override
  Future<void> deletePostFromId({required String docId}) async {
    collectionRef.doc(docId).delete();
  }

  @override
  void dispose() {
    _postsStreamController.close();
  }
}
