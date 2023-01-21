import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/models/post.dart';
import '../../../domain/repositories/post_repository.dart';
import 'documents/post_document.dart';

/// Firebase 投稿リポジトリ
class FirebasePostRepository implements IPostRepository {
  FirebasePostRepository({
    required this.collectionRef,
  }) {
    // postsコレクションの変更を監視する
    _postsSubscription = _postsQuery.snapshots().listen((snapshot) {
      if (_postsStreamController.isClosed) {
        return;
      }

      final latest =
          snapshot.docs.map((doc) => doc.data().toPost(id: doc.id)).toList();

      _postsStreamController.add(latest);
    });
  }

  final CollectionReference<PostDocument> collectionRef;

  final _postsStreamController = StreamController<List<Post>>.broadcast();

  /// コレクションの監視をキャンセルするために保持
  StreamSubscription<QuerySnapshot<PostDocument>>? _postsSubscription;

  /// 投稿リストのクエリ
  ///
  /// ＜検索条件＞
  /// ORDER BY content ASC
  Query<PostDocument> get _postsQuery => collectionRef
      .withConverter<PostDocument>(
        fromFirestore: (snapshot, _) => PostDocument.fromJson(snapshot.data()!),
        toFirestore: (postDoc, options) => postDoc.toJson(),
      )
      .orderBy('content', descending: false);

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
  Stream<List<Post>> postsChanges() {
    return _postsStreamController.stream;
  }

  @override
  Future<List<Post>> fetchPosts() async {
    final snapshot = await _postsQuery.get();
    return snapshot.docs.map((doc) => doc.data().toPost(id: doc.id)).toList();
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
    _postsSubscription?.cancel();
    _postsStreamController.close();
  }
}
