import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 投稿ページタイトル
final postTitleProvider = Provider<String>((_) => '投稿');

/// 投稿本文見出し
final contentLabelProvider = Provider<String>((_) => 'content');

/// アカウントID見出し
final accountIdLabelProvider = Provider<String>((_) => 'AccountId');

/// 本文テキストコントローラ
final contentControllerStateProvider = StateProvider.autoDispose<TextEditingController>((_) => TextEditingController(text: ''));

/// アカウントIDテキストコントローラ
final accountIdControllerStateProvider = StateProvider.autoDispose<TextEditingController>((_) => TextEditingController(text: ''));

/// タイムラインページタイトル
final timeLineTitleProvider = Provider<String>((_) => 'タイムライン');
