import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_reference_app/presentation/page/post/component/post_button.dart';
import 'package:flutter_reference_app/presentation/page/post/component/post_text_form_field.dart';
import 'package:flutter_reference_app/presentation/page/post/post_page.dart';

import '../test_agent.dart';

void main() {
  final agent = TestAgent();
  testWidgets('画面に意図したコンポーネントが設置されていること', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: agent.providerOverrides,
        child: const MaterialApp(
          home: PostPage(),
        ),
      ),
    );
    expect(find.byType(PostContentTextFormField), findsOneWidget);
    expect(find.byType(PostContributorTextFormField), findsOneWidget);
    expect(find.byType(PostButton), findsOneWidget);
  });
}
