import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'posts/documents/post_document.dart';

/// Firestoreのインスタンスを保持するプロバイダ
final firebaseFirestoreProvider = Provider((_) => FirebaseFirestore.instance);

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
