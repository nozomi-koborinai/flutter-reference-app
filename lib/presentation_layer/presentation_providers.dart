import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/domain_layer/domain_providers.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/post_page_view_model.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/time_line_page_view_model.dart';

/// 投稿ページタイトル
final postTitleProvider = Provider<String>((ref) => '投稿');

/// 投稿本文見出し
final contentLabelProvider = Provider<String>((ref) => 'content');

/// アカウントID見出し
final accountIdLabelProvider = Provider<String>((ref) => 'AccountId');

/// 本文テキストコントローラ
final contentControllerStateProvider =
    StateProvider((_) => TextEditingController(text: ''));

/// アカウントIDテキストコントローラ
final accountIdControllerStateProvider =
    StateProvider((_) => TextEditingController(text: ''));

/// タイムラインページタイトル
final timeLineTitleProvider = Provider<String>((ref) => 'タイムライン');
