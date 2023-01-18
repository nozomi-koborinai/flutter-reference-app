import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/post.dart';
import '../../utils/convert_utils.dart';
import 'posts/dtos/post_document.dart';

/// Firestoreのインスタンスを保持するプロバイダ
final firebaseFirestoreProvider = Provider((_) => FirebaseFirestore.instance);

/// 投稿コレクション参照プロバイダー
final postsCollectionRefProvider = Provider(
  (ref) => ref.watch(firebaseFirestoreProvider).collection('posts'),
);

/// 投稿一覧StreamProvider
final StreamProvider<List<Post>> postListStreamProvider =
    StreamProvider<List<Post>>((ref) {
  return ref.watch(postsCollectionRefProvider).snapshots().map((snapshot) {
    final list = snapshot.docs.map((doc) {
      final jsonObject = PostDocument.fromJson(doc.data());
      return ConvertUtils.instance.toPost(postDoc: jsonObject, id: doc.id);
    }).toList();
    return list;
  });
});
