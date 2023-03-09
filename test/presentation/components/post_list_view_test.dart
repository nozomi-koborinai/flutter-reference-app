import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_reference_app/presentation/pages/time_line/components/post_list_view.dart';

import '../../test_agent.dart';

void main() {
  final agent = TestAgent();
  setUp(agent.setUp);

  testWidgets('投稿情報が全件分（5件）表示されること', (WidgetTester tester) async {
    // 投稿リストを初期化
    await tester.pumpWidget(
      ProviderScope(
        overrides: agent.providerOverrides,
        child: const MaterialApp(home: Scaffold(body: PostListView())),
      ),
    );

    // 投稿リスト読み込み（非同期処理）が完了するまで待つ
    await tester.pump();

    // 読み込み完了後は投稿リストの件数分ListTileが生成される
    expect(find.byType(ListTile), findsNWidgets(5));
  });
}
