import 'package:flutter_reference_app/domain/post/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../infrastructure/mocks/mock_post_repository.dart';
import '../test_agent.dart';

void main() {
  final agent = TestAgent();
  setUp(agent.setUp);

  group('postRepositoryProviderのテスト', () {
    test('DIする前はUnimplementedErrorがthrowされること', () {
      expect(
        () => ProviderContainer().read(postRepositoryProvider),
        throwsUnimplementedError,
      );
    });
    test('MockPostRepositoryがDIされていること', () async {
      expect(
        agent.container.read(postRepositoryProvider) is MockPostRepository,
        true,
      );
    });
  });
}
