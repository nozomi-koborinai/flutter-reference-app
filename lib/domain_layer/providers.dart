import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/data_layer/models/post_document.dart';
import 'package:repository_riverpod_mvvm/data_layer/repositories/post_repository.dart';
import 'package:repository_riverpod_mvvm/domain_layer/interfaces/i_post_repository.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/post_page_view_model.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/time_line_page_view_model.dart';
import 'package:repository_riverpod_mvvm/utils/app_values.dart';

//# Firebase関連のProvider Start
/// Firestoreのインスタンスを返却
final firebaseFirestoreProvider = Provider((_) => FirebaseFirestore.instance);
//# Firebase関連のProvider End

//# PostRepository関連のProvider Start
/// 必ずmainメソッドで本ProviderをOverrideすること！
final postRepositoryProvider = Provider<IPostRepository>(
  (_) => throw UnimplementedError(),
);

/// PostRepositoryのインスタンスを返却
final firebasePostRepositoryProvider = Provider<IPostRepository>(
  (ref) => PostRepository(
    // PostRepositoryインスタンス生成時、FirestoreインスタンスをDI
    store: ref.watch(firebaseFirestoreProvider),
  ),
);
//# Repository関連のProvider End

//# PostPage関連のProvider Start
/// 投稿ページタイトル
final postTitleProvider = Provider<String>((ref) => '投稿');

/// 投稿本文見出し
final contentLabelProvider = Provider<String>((ref) => 'content');

/// アカウントID見出し
final accountIdLabelProvider = Provider<String>((ref) => 'AccountId');

/// 本文テキストコントローラ
final contentControllerStateProvider =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));

/// アカウントIDテキストコントローラ
final accountIdControllerStateProvider =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));

/// PostPageViewModelのインスタンスを返却
final postPageViewModelProvider = Provider(
  (ref) => PostPageViewModel(
    ref.watch(postRepositoryProvider),
  ),
);
//# PostPage関連のProvider End

//# TimeLinePage関連のProvider Start
/// タイムラインページタイトル
final timeLineTitleProvider = Provider<String>((ref) => 'タイムライン');

/// Firestore.postsコレクションの全データのStream
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

/// TimeLinePageViewModelのインスタンスを返却
final timeLinePageViewModelProvider = Provider(
  (ref) => TimeLinePageViewModel(
    ref.watch(postRepositoryProvider),
  ),
);
//# TimeLinePage関連のProvider End