import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post_document.freezed.dart';
part 'post_document.g.dart';

@freezed
class PostDocument with _$PostDocument {
  const factory PostDocument(
    @JsonKey(name: 'content') String content,
    @JsonKey(name: 'account_id') String accountId,
  ) = _PostDocument;

  factory PostDocument.fromJson(Map<String, dynamic> json) =>
      _$PostDocumentFromJson(json);
}
