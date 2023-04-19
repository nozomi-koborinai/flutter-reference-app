class DomainException implements Exception {
  const DomainException(this.message);

  final String message;
}

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
