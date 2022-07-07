import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/infrastructure_layer/models/post_document.dart';
import 'package:repository_riverpod_mvvm/infrastructure_layer/repositories/post_repository.dart';
import 'package:repository_riverpod_mvvm/domain_layer/interfaces/i_post_repository.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';

/// 必ずmainメソッドで本ProviderをOverrideすること！
final postRepositoryProvider = Provider<IPostRepository>(
  (_) => throw UnimplementedError(),
);

/// Firestoreのインスタンスを保持するプロバイダ
final firebaseFirestoreProvider = Provider((_) => FirebaseFirestore.instance);

///投稿コレクション名のプロバイダ
final postsCollectionNameProvider = Provider((_) => 'posts');

///投稿コレクションReferenceのプロバイダ
final postsCollectionRefProvider =
    Provider<CollectionReference<Map<String, dynamic>>>((ref) => ref
        .watch(firebaseFirestoreProvider)
        .collection(ref.watch(postsCollectionNameProvider)));

/// PostRepositoryのインスタンスを保持するプロバイダ
final firebasePostRepositoryProvider = Provider<IPostRepository>(
  (ref) => PostRepository(
    // PostRepositoryインスタンス生成時、投稿コレクションをDI
    collectionRef: ref.watch(postsCollectionRefProvider),
  ),
);

final postListStreamProvider = StreamProvider((ref) {
  return ref.watch(postsCollectionRefProvider).snapshots().map((snapshot) {
    final list = snapshot.docs.map((doc) {
      final jsonObject = PostDocument.fromJson(doc.data());
      return Post(jsonObject.content, jsonObject.accountId);
    }).toList();
    return list;
  });
});
