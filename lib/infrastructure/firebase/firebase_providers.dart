import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/post.dart';
import 'posts/post_repository.dart';

/// Firestoreのインスタンスを保持するプロバイダ
final firebaseFirestoreProvider = Provider((_) => FirebaseFirestore.instance);

/// 投稿一覧StreamProvider
final StreamProvider<List<Post>> postListStreamProvider =
    StreamProvider<List<Post>>((ref) {
  return ref.watch(postsCollectionRefProvider).snapshots().map((snapshot) {
    final list =
        snapshot.docs.map((doc) => doc.data().toPost(id: doc.id)).toList();
    return list;
  });
});
