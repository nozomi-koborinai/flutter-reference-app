import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:repository_riverpod_mvvm/domain/interfaces/i_post_repository.dart';
import 'package:repository_riverpod_mvvm/domain/models/post.dart';
import 'package:repository_riverpod_mvvm/utils/convert_utils.dart';

class PostRepository implements IPostRepository {
  PostRepository({
    required this.collectionRef,
  });

  final CollectionReference<Map<String, dynamic>> collectionRef;

  /// 投稿新規追加
  @override
  Future<void> addPost(Post newPost) async {
    // ドメイン層のモデル(Post)をインフラ層のモデル(PostDocument)に変換
    final newPostDoc = ConvertUtils.instance.toPostDoc(post: newPost);
    await collectionRef.add(newPostDoc.toJson());
  } 
  
  /// 投稿IDを元に投稿ドキュメント削除
  @override
  Future<void> deletePostFromId(String id) async => collectionRef.doc(id).delete();

    /// ユーザIdに紐づく投稿情報を取得
  @override
  Future<List<Post>> fetchPostFromUserId(String id) async {
    throw UnimplementedError();
  }
}