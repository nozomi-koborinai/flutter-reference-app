import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';

// StateNotifierProvider に渡すことになる StateNotifier クラス
// このクラスではステートを `state` プロパティの外に公開しない
// つまり、ステートに関しては public なゲッターやプロパティは作らない
// public メソッドを通じて UI 側にステートの操作を許可する
// イミュータブルな構成
class PostsNotifier extends StateNotifier<List<Post>> {
  // Todo リストを空のリストとして初期化します。
  PostsNotifier() :super([]);
  
}