import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_layered_architecture/presentation/theme.dart';

import 'pages/time_line_page.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Riverpod Layered Architecture',
      debugShowCheckedModeBanner: false,
      theme: ref.read(themeProvider),
      home: const TimeLinePage(),
    );
  }
}
