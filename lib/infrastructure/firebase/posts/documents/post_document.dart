import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/post.dart';

part 'post_document.freezed.dart';
part 'post_document.g.dart';

@freezed
class PostDocument with _$PostDocument {
  const factory PostDocument({
    required String content,
    required String accountId,
  }) = _PostDocument;

  const PostDocument._();

  factory PostDocument.fromJson(Map<String, dynamic> json) =>
      _$PostDocumentFromJson(json);

  /// PostDocument -> Post
  Post toPost({required String id}) {
    return Post(
      content: content,
      accountId: accountId,
      id: id,
    );
  }
}
