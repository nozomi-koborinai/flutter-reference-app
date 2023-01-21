import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/domain_providers.dart';
import 'firebase_options.dart';
import 'infrastructure/firebase/posts/post_repository.dart';
import 'presentation/app.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      overrides: [
        // 各プロバイダーをoverrideする
        postRepositoryProvider.overrideWith((ref) {
          final repository = FirebasePostRepository(
            collectionRef: ref.watch(postsCollectionRefProvider),
          );
          return repository;
        })
      ],
      child: const App(),
    ),
  );
}
