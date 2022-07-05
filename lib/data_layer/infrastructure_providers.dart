import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/data_layer/models/post_document.dart';
import 'package:repository_riverpod_mvvm/data_layer/repositories/post_repository.dart';
import 'package:repository_riverpod_mvvm/domain_layer/interfaces/i_post_repository.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';
import 'package:repository_riverpod_mvvm/utils/app_values.dart';

/// 必ずmainメソッドで本ProviderをOverrideすること！
final postRepositoryProvider = Provider<IPostRepository>(
  (_) => throw UnimplementedError(),
);

/// Firestoreのインスタンスを返却
final firebaseFirestoreProvider = Provider((_) => FirebaseFirestore.instance);

/// PostRepositoryのインスタンスを返却
final firebasePostRepositoryProvider = Provider<IPostRepository>(
  (ref) => PostRepository(
    // PostRepositoryインスタンス生成時、FirestoreインスタンスをDI
    store: ref.watch(firebaseFirestoreProvider),
  ),
);

final postListStreamProvider = StreamProvider.autoDispose((ref) {
  return ref
      .watch(firebaseFirestoreProvider)
      .collection(collectionNamePosts)
      .snapshots()
      .map((snapshot) {
    final list = snapshot.docs.map((doc) {
      final jsonObject = PostDocument.fromJson(doc.data());
      return Post(jsonObject.content, jsonObject.accountId);
    }).toList();
    return list;
  });
});
