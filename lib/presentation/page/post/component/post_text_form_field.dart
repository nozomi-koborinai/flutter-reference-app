import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/usecase/post/state/selected_post.dart';

final contentControllerProvider =
    StateProvider.autoDispose<TextEditingController>(
  (ref) =>
      TextEditingController(text: ref.watch(selectedPostProvider)?.content),
);
final contributorControllerProvider =
    StateProvider.autoDispose<TextEditingController>(
  (ref) =>
      TextEditingController(text: ref.watch(selectedPostProvider)?.contributor),
);

class PostContentTextFormField extends ConsumerWidget {
  const PostContentTextFormField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: ref.watch(contentControllerProvider),
      enabled: true,
      style: const TextStyle(color: Colors.black),
      obscureText: false,
      maxLines: 1,
      decoration: const InputDecoration(
        labelText: 'content',
      ),
    );
  }
}

class PostContributorTextFormField extends ConsumerWidget {
  const PostContributorTextFormField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: ref.watch(contributorControllerProvider),
      enabled: true,
      style: const TextStyle(color: Colors.black),
      obscureText: false,
      maxLines: 1,
      decoration: const InputDecoration(
        labelText: 'contributor',
      ),
    );
  }
}
