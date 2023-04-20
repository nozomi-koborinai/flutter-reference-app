import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_document.freezed.dart';
part 'post_document.g.dart';

@freezed
class PostDocument with _$PostDocument {
  const factory PostDocument({
    required String content,
    required String contributor,
  }) = _PostDocument;

  factory PostDocument.fromJson(Map<String, dynamic> json) =>
      _$PostDocumentFromJson(json);
}
