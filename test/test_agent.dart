import 'package:flutter_reference_app/application/usecase/post/state/selected_post.dart';
import 'package:flutter_reference_app/domain/post/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'infrastructure/mocks/mock_post_repository.dart';

/// テストエージェント
class TestAgent {
  TestAgent();
  late ProviderContainer container;
  get providerOverrides => [
        postRepositoryProvider.overrideWithValue(
          MockPostRepository(),
        ),
      ];

  Future<void> setUp() async {
    container = ProviderContainer(overrides: providerOverrides);
    container.read(selectedPostProvider.notifier).set(null);
  }
}
