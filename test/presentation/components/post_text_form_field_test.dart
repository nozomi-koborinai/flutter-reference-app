import 'package:flutter/material.dart';
import 'package:flutter_reference_app/usecase/state/selected_post.dart';
import 'package:flutter_reference_app/domain/post/entity/post.dart';
import 'package:flutter_reference_app/presentation/pages/post/components/post_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_agent.dart';

void main() {
  final agent = TestAgent();
  setUp(agent.setUp);

  group('新規投稿時のWidgetテスト', () {
    testWidgets('テキストに空が設定されること', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: agent.providerOverrides,
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: const [
                  PostContentTextFormField(),
                  PostContributorTextFormField()
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text(''), findsOneWidget);
    });
  });

  // TODO:テストが通らないので直す
  group('投稿編集時のWidgetテスト', () {
    testWidgets('テキストに選択中の投稿内容が設定されること', (WidgetTester tester) async {
      ProviderContainer()
          .read(selectedPostProvider.notifier)
          .set(const Post(content: '投稿内容', contributor: '投稿者'));
      await tester.pumpWidget(
        ProviderScope(
          overrides: agent.providerOverrides,
          child: MaterialApp(
            home: Scaffold(
              body: Column(
                children: const [
                  PostContentTextFormField(),
                  PostContributorTextFormField()
                ],
              ),
            ),
          ),
        ),
      );
      expect(find.text('投稿内容'), findsOneWidget);
      expect(find.text('投稿者'), findsOneWidget);
    });
  });
}
