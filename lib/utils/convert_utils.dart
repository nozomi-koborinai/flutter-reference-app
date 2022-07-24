import 'package:repository_riverpod_mvvm/domain_layer/models/post.dart';
import 'package:repository_riverpod_mvvm/infrastructure_layer/dtos/post_document.dart';

/// ドメイン層のモデルからインフラ層のモデルへの変換
/// インフラ層のモデルからドメイン層のモデルへの変換
class ConvertUtils {
  /// singleTon
  ConvertUtils._();
  static final instance = ConvertUtils._();

  /// Post -> PostDocument
  PostDocument toPostDoc({required Post post}) {
    return PostDocument(content: post.content, accountId: post.accountId);
  }

  /// PostDocument -> Post
  Post toPost({required PostDocument postDoc, String? id}) {
    final post = Post(content: postDoc.content, 
                      accountId: postDoc.accountId,
                      // ignore: unnecessary_null_in_if_null_operators
                      id: id ?? null
                );
    return post;
  }
}