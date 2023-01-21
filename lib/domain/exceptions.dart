/// 基底ドメイン例外
///
/// ドメイン層が定義する例外の基底クラス
abstract class DomainException implements Exception {
  const DomainException(this.message);

  final Object message;
}

/// 入力値検査例外
class ValidatorException extends DomainException {
  const ValidatorException._([
    super.message = 'validator exception',
    ValidatorExceptionCode? code,
    this.target,
  ]) : code = code ?? ValidatorExceptionCode.unknown;

  /// 引数が不正
  factory ValidatorException.invalidArgument([String? target]) =>
      ValidatorException._(
        'Invalid argument',
        ValidatorExceptionCode.invalidArgument,
        target,
      );

  /// エラーコード
  final ValidatorExceptionCode code;

  /// 対象
  final String? target;

  @override
  String toString() => 'ValidatorException[${code.name}]: $message';
}

/// 入力値検査例外のエラーコード
enum ValidatorExceptionCode {
  /// 引数が不正
  invalidArgument,

  /// 不明なエラー
  unknown,
  ;
}

/// データベース関連の例外
///
/// リポジトリ実装がこの例外を投げたら、プレゼンテーション層
/// で受け取って適切に表示すること。
class DatabaseException extends DomainException {
  const DatabaseException._([
    super.message = 'database exception',
    DatabaseExceptionCode? code,
  ]) : code = code ?? DatabaseExceptionCode.unknown;

  /// データが見つからない
  factory DatabaseException.notFound() => const DatabaseException._(
        'No data found.',
        DatabaseExceptionCode.notFound,
      );

  /// 不明なエラー
  factory DatabaseException.unknown() => const DatabaseException._(
        'An unknown error has occurred.',
        DatabaseExceptionCode.unknown,
      );

  /// エラーコード
  final DatabaseExceptionCode code;

  @override
  String toString() => 'DatabaseException[${code.name}]: $message';
}

/// データベース関連の例外のエラーコード
enum DatabaseExceptionCode {
  /// データが見つからない
  notFound,

  /// 不明なエラー
  unknown,
  ;
}

/// ネットワーク関連の例外
///
/// リポジトリ実装がこの例外を投げたら、プレゼンテーション層
/// で受け取って適切に表示すること。
class NetworkException extends DomainException {
  const NetworkException._([
    super.message = 'network exception',
    NetworkExceptionCode? code,
  ]) : code = code ?? NetworkExceptionCode.unknown;

  /// 1. 無効なJSONを送信すると、`400 Bad Request` レスポンスが返されます。
  /// 2. 間違ったタイプの JSON 値を送信すると、`400 Bad Request` レスポンスが返されます。
  factory NetworkException.badRequest() => const NetworkException._(
        'Illegal request sent. (400)',
        NetworkExceptionCode.badRequest,
      );

  /// 無効な認証情報で認証すると、`401 Unauthorized` が返されます。
  factory NetworkException.badCredentials() => const NetworkException._(
        'Illegal request sent. (401)',
        NetworkExceptionCode.badCredentials,
      );

  /// API は、無効な認証情報を含むリクエストを短期間に複数回検出すると、`403 Forbidden` で、
  /// そのユーザーに対するすべての認証試行（有効な認証情報を含む）を一時的に拒否します。
  factory NetworkException.maximumNumberOfLoginAttemptsExceeded() =>
      const NetworkException._(
        'Please wait a while and try again. (403)',
        NetworkExceptionCode.maximumNumberOfLoginAttemptsExceeded,
      );

  /// `404 Not Found`
  factory NetworkException.notFound() => const NetworkException._(
        'No data found. (404)',
        NetworkExceptionCode.notFound,
      );

  /// 無効なフィールドを送信すると、`422 Unprocessable Entity` レスポンスが返されます。
  factory NetworkException.validationFailed() => const NetworkException._(
        'Illegal request sent. (422)',
        NetworkExceptionCode.validationFailed,
      );

  /// `503 Service Unavailable` サービス停止中
  factory NetworkException.serviceUnavailable() => const NetworkException._(
        'Please wait a while and try again.  (503)',
        NetworkExceptionCode.serviceUnavailable,
      );

  /// インターネット接続不可
  factory NetworkException.noInternetConnection() => const NetworkException._(
        'Please try again in a good communication environment. (-2)',
        NetworkExceptionCode.noInternetConnection,
      );

  /// 不明なエラー
  factory NetworkException.unknown() => const NetworkException._(
        'An unknown error has occurred. (-1)',
        NetworkExceptionCode.unknown,
      );

  /// エラーコード
  final NetworkExceptionCode code;

  @override
  String toString() => 'NetworkException[${code.name}]: $message';
}

/// ネットワーク関連の例外のエラーコード
enum NetworkExceptionCode {
  /// 不正なリクエスト
  badRequest,

  /// 不正な認証情報
  badCredentials,

  /// 短期間に無効な認証情報を受け取った
  maximumNumberOfLoginAttemptsExceeded,

  /// データが見つからない
  notFound,

  /// 無効なフィールドが見つかった
  validationFailed,

  /// サービス停止中
  serviceUnavailable,

  /// インターネット接続不可
  noInternetConnection,

  /// 不明なエラー
  unknown,
  ;
}

/// 認証関連の例外
///
/// リポジトリ実装がこの例外を投げたら、プレゼンテーション層
/// で受け取って適切に表示すること。
class AuthException extends DomainException {
  const AuthException._([
    super.message = 'auth exception',
    AuthExceptionCode? code,
  ]) : code = code ?? AuthExceptionCode.unknown;

  factory AuthException.invalidEmail() => const AuthException._(
        'Indicates the email is invalid',
        AuthExceptionCode.invalidEmail,
      );
  factory AuthException.wrongPassword() => const AuthException._(
        'Indicates the user attempted sign in with a wrong password',
        AuthExceptionCode.wrongPassword,
      );
  factory AuthException.weakPassword() => const AuthException._(
        'Indicates an attempt to set a password that is considered too weak',
        AuthExceptionCode.weakPassword,
      );
  factory AuthException.userNotFound() => const AuthException._(
        'Indicates the user account was not found',
        AuthExceptionCode.userNotFound,
      );
  factory AuthException.userDisabled() => const AuthException._(
        'Indicates the user\'s account is disabled on the server.',
        AuthExceptionCode.userDisabled,
      );
  factory AuthException.tooManyRequests() => const AuthException._(
        'Indicates that too many requests were made to a server method',
        AuthExceptionCode.tooManyRequests,
      );
  factory AuthException.operationNotAllowed() => const AuthException._(
        'Indicates the administrator disabled sign in with the '
        'specified identity provider',
        AuthExceptionCode.operationNotAllowed,
      );
  factory AuthException.networkRequestFailed() => const AuthException._(
        'Indicates a network error occurred (such as a timeout, '
        'interrupted connection, or unreachable host).',
        AuthExceptionCode.networkRequestFailed,
      );
  factory AuthException.emailAlreadyInUse() => const AuthException._(
        'Indicates the email used to attempt a sign up is already in use.',
        AuthExceptionCode.emailAlreadyInUse,
      );
  factory AuthException.userMismatch() => const AuthException._(
        'Indicates that an attempt was made to reauthenticate '
        'with a user which is not the current user',
        AuthExceptionCode.userMismatch,
      );

  factory AuthException.invalidActionCode() => const AuthException._(
        'The provided email is already in use by an existing user. '
        'Each user must have a unique email.',
        AuthExceptionCode.invalidActionCode,
      );

  factory AuthException.notVerifiedEmail() => const AuthException._(
        'Not verified email.',
        AuthExceptionCode.notVerifiedEmail,
      );

  factory AuthException.requiresRecentLogin() => const AuthException._(
        'Indicates the user has attemped to change email or password '
        'more than 5 minutes after signing in',
        AuthExceptionCode.requiresRecentLogin,
      );

  factory AuthException.invalidCredential() => const AuthException._(
        'The supplied auth credential is invalid.',
        AuthExceptionCode.invalidCredential,
      );

  /// 不明なエラー
  factory AuthException.unknown() => const AuthException._(
        'An unknown error has occurred.',
        AuthExceptionCode.unknown,
      );

  /// エラーコード
  final AuthExceptionCode code;

  @override
  String toString() => 'AuthException[${code.name}]: $message';
}

/// 認証関連の例外のエラーコード
enum AuthExceptionCode {
  /// 不正なメールアドレス
  invalidEmail,

  /// パスワード誤り
  wrongPassword,

  /// パスワードが弱い
  weakPassword,

  /// ユーザーが見つからない
  userNotFound,

  /// ユーザーが無効
  userDisabled,

  /// 短期間に大量のアクセス拒否
  tooManyRequests,

  /// 無効な操作
  operationNotAllowed,

  /// ネットワーク不正
  networkRequestFailed,

  /// 既に使われているメールアドレス
  emailAlreadyInUse,

  /// 異なるユーザーで再認証が実施された
  userMismatch,

  /// アクションコードが不正
  invalidActionCode,

  /// メールアドレスが確認されていない
  notVerifiedEmail,

  /// 最近ログイン済み
  requiresRecentLogin,

  /// 不正な認証情報
  invalidCredential,

  /// 不明なエラー
  unknown,
  ;
}
