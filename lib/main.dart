import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reference_app/domain/post/post_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'application/usecase/post/post_usecase_impl.dart';
import 'domain/post/post_repository.dart';
import 'firebase_options.dart';
import 'infrastructure/firebase/post/post_repository_impl.dart';
import 'presentation/app.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      overrides: [
        // 各プロバイダーに具象を注入

        // 投稿ユースケース
        postUsecaseProvider.overrideWith((ref) {
          return PostUsecaseImpl(ref);
        }),

        // 投稿リポジトリ
        postRepositoryProvider.overrideWith(
          (ref) {
            final repository = PostRepositoryImpl(
              collectionRef: ref.watch(postCollectionRefProvider),
            );
            ref.onDispose(repository.dispose);
            return repository;
          },
        ),
      ],
      child: const App(),
    ),
  );
}
