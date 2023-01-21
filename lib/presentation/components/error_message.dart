import '../../domain/exceptions.dart';

extension ObjectHelper on Object {
  /// エラーメッセージを返す
  String get errorMessage {
    if (this is DatabaseException) {
      final error = this as DatabaseException;
      switch (error.code) {
        case DatabaseExceptionCode.notFound:
          return 'データが見つかりませんでした';
        case DatabaseExceptionCode.unknown:
          return '不明なエラーが発生しました';
      }
    }
    if (this is NetworkException) {
      final error = this as NetworkException;
      switch (error.code) {
        case NetworkExceptionCode.badRequest:
          return '不正なリクエストが送信されました (400)';
        case NetworkExceptionCode.badCredentials:
          return '不正なリクエストが送信されました (401)';
        case NetworkExceptionCode.maximumNumberOfLoginAttemptsExceeded:
          return 'しばらく時間をおいてから再度お試しください (403)';
        case NetworkExceptionCode.notFound:
          return 'データが見つかりませんでした (404)';
        case NetworkExceptionCode.validationFailed:
          return '不正なリクエストが送信されました (422)';
        case NetworkExceptionCode.serviceUnavailable:
          return 'しばらく時間をおいてから再度お試しください (503)';
        case NetworkExceptionCode.unknown:
          return '不明なエラーが発生しました (-1)';
        case NetworkExceptionCode.noInternetConnection:
          return '通信環境の良いところで再度お試しください (-2)';
      }
    }
    if (this is AuthException) {
      final error = this as AuthException;
      switch (error.code) {
        case AuthExceptionCode.invalidEmail:
          return 'メールアドレスを正しい形式で入力してください。';
        case AuthExceptionCode.wrongPassword:
          return 'パスワードが間違っています。';
        case AuthExceptionCode.weakPassword:
          return 'パスワードは6文字以上にしてください。';
        case AuthExceptionCode.userNotFound:
          return 'アカウントが見つかりません。';
        case AuthExceptionCode.userDisabled:
          return '無効なアカウントです。';
        case AuthExceptionCode.tooManyRequests:
          return 'しばらく経ってから再度お試しください。';
        case AuthExceptionCode.operationNotAllowed:
          return 'ログインが許可されていません。管理者にご連絡ください。';
        case AuthExceptionCode.networkRequestFailed:
          return 'タイムアウトしました。';
        case AuthExceptionCode.emailAlreadyInUse:
          return '既に使われているメールアドレスです。';
        case AuthExceptionCode.userMismatch:
          return '異なるメールアドレスでログインしようとしています。';
        case AuthExceptionCode.invalidActionCode:
          return '無効なログインリンクです。ログインリンクが正しいかご確認ください。';
        case AuthExceptionCode.notVerifiedEmail:
          return '認証が完了していません。メールをご確認ください。';
        case AuthExceptionCode.requiresRecentLogin:
          return 'ログインし直してから再度お試し下さい。';
        case AuthExceptionCode.invalidCredential:
          return '不正な認証情報です。端末の時刻情報が正しいかご確認ください。';
        case AuthExceptionCode.unknown:
          return 'エラーが発生しました。';
      }
    }
    if (this is Exception &&
        toString() == 'Exception: no routes for location: error') {
      return '404 NOT FOUND\nページが見つかりませんでした';
    }
    return toString();
  }
}
