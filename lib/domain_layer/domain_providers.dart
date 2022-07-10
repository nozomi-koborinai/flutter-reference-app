import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/domain_layer/interfaces/i_post_repository.dart';

final postRepositoryProvider = Provider<IPostRepository>(
  (_) => throw UnimplementedError(),
);
