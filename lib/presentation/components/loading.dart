import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// オーバーレイローディングを表示するかどうかのプロバイダー
final overlayLoadingProvider = StateProvider(
  (_) => false,
);

/// 二度押しを防止したいときなどのオーバーレイローディング
class OverlayLoading extends StatelessWidget {
  const OverlayLoading({
    super.key,
    this.backgroundColor = Colors.black26,
  });

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
