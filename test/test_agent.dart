import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_layered_architecture/domain/repositories/post_repository.dart';

import 'infrastructure/mocks/mock_post_repository.dart';

/// テストエージェント
class TestAgent {
  TestAgent();
  late ProviderContainer container;

  Future<void> setUp() async {
    container = ProviderContainer(
      overrides: [
        postRepositoryProvider.overrideWithValue(MockPostRepository()),
      ],
    );
  }
}
