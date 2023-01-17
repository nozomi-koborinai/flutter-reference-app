// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostDocument _$PostDocumentFromJson(Map<String, dynamic> json) {
  return _PostDocument.fromJson(json);
}

/// @nodoc
mixin _$PostDocument {
  @JsonKey(name: 'content')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  String get accountId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostDocumentCopyWith<PostDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDocumentCopyWith<$Res> {
  factory $PostDocumentCopyWith(
          PostDocument value, $Res Function(PostDocument) then) =
      _$PostDocumentCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'content') String content,
      @JsonKey(name: 'account_id') String accountId});
}

/// @nodoc
class _$PostDocumentCopyWithImpl<$Res> implements $PostDocumentCopyWith<$Res> {
  _$PostDocumentCopyWithImpl(this._value, this._then);

  final PostDocument _value;
  // ignore: unused_field
  final $Res Function(PostDocument) _then;

  @override
  $Res call({
    Object? content = freezed,
    Object? accountId = freezed,
  }) {
    return _then(_value.copyWith(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: accountId == freezed
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PostDocumentCopyWith<$Res>
    implements $PostDocumentCopyWith<$Res> {
  factory _$$_PostDocumentCopyWith(
          _$_PostDocument value, $Res Function(_$_PostDocument) then) =
      __$$_PostDocumentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'content') String content,
      @JsonKey(name: 'account_id') String accountId});
}

/// @nodoc
class __$$_PostDocumentCopyWithImpl<$Res>
    extends _$PostDocumentCopyWithImpl<$Res>
    implements _$$_PostDocumentCopyWith<$Res> {
  __$$_PostDocumentCopyWithImpl(
      _$_PostDocument _value, $Res Function(_$_PostDocument) _then)
      : super(_value, (v) => _then(v as _$_PostDocument));

  @override
  _$_PostDocument get _value => super._value as _$_PostDocument;

  @override
  $Res call({
    Object? content = freezed,
    Object? accountId = freezed,
  }) {
    return _then(_$_PostDocument(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: accountId == freezed
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostDocument with DiagnosticableTreeMixin implements _PostDocument {
  const _$_PostDocument(
      {@JsonKey(name: 'content') required this.content,
      @JsonKey(name: 'account_id') required this.accountId});

  factory _$_PostDocument.fromJson(Map<String, dynamic> json) =>
      _$$_PostDocumentFromJson(json);

  @override
  @JsonKey(name: 'content')
  final String content;
  @override
  @JsonKey(name: 'account_id')
  final String accountId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostDocument(content: $content, accountId: $accountId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostDocument'))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('accountId', accountId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostDocument &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.accountId, accountId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(accountId));

  @JsonKey(ignore: true)
  @override
  _$$_PostDocumentCopyWith<_$_PostDocument> get copyWith =>
      __$$_PostDocumentCopyWithImpl<_$_PostDocument>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostDocumentToJson(this);
  }
}

abstract class _PostDocument implements PostDocument {
  const factory _PostDocument(
          {@JsonKey(name: 'content') required final String content,
          @JsonKey(name: 'account_id') required final String accountId}) =
      _$_PostDocument;

  factory _PostDocument.fromJson(Map<String, dynamic> json) =
      _$_PostDocument.fromJson;

  @override
  @JsonKey(name: 'content')
  String get content => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'account_id')
  String get accountId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PostDocumentCopyWith<_$_PostDocument> get copyWith =>
      throw _privateConstructorUsedError;
}
