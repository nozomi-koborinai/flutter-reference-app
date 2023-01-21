import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_layered_architecture/presentation/theme.dart';

import 'components/dialog.dart';
import 'components/loading.dart';
import 'components/scaffold_messenger.dart';
import 'pages/time_line_page.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Riverpod Layered Architecture',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      navigatorKey: ref.watch(navigatorKeyProvider),
      theme: ref.read(themeProvider),
      home: const TimeLinePage(),
      builder: (context, child) {
        return Consumer(
          builder: (context, ref, _) {
            final isLoading = ref.watch(overlayLoadingProvider);
            return Stack(
              children: [
                child!,
                // ローディング表示
                if (isLoading) const OverlayLoading()
              ],
            );
          },
        );
      },
    );
  }
}
