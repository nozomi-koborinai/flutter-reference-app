import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/data_layer/infrastructure_providers.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/post_page_view_model.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/time_line_page_view_model.dart';

/// PostPageViewModelのインスタンスを返却するプロバイダ
final postPageViewModelProvider = Provider(
  (ref) => PostPageViewModel(
    ref.watch(postRepositoryProvider),
  ),
);

/// TimeLinePageViewModelのインスタンスを返却
final timeLinePageViewModelProvider = Provider(
  (ref) => TimeLinePageViewModel(
    ref.watch(postRepositoryProvider),
  ),
);

/// 投稿ページタイトル
final postTitleProvider = Provider<String>((ref) => '投稿');

/// 投稿本文見出し
final contentLabelProvider = Provider<String>((ref) => 'content');

/// アカウントID見出し
final accountIdLabelProvider = Provider<String>((ref) => 'AccountId');

/// 本文テキストコントローラ
final contentControllerStateProvider =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));

/// アカウントIDテキストコントローラ
final accountIdControllerStateProvider =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));

/// タイムラインページタイトル
final timeLineTitleProvider = Provider<String>((ref) => 'タイムライン');
