import 'package:flutter/material.dart';
import 'package:flutter_reference_app/presentation/router_config.dart';
import 'package:flutter_reference_app/presentation/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/state/overlay_loading_provider.dart';
import 'component/loading.dart';
import 'component/scaffold_messenger.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter Reference App',
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(routerConfigProvider),
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      theme: ref.read(themeProvider),
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
