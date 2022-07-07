import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/infrastructure_layer/infrastructure_providers.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/views/time_line_page.dart';

void main() async {
  runApp(
    ProviderScope(
      overrides: [
        postRepositoryProvider
            .overrideWithProvider(firebasePostRepositoryProvider),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod_MVVM_Practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //タイムラインページを表示
      home: const TimeLinePage(),
    );
  }
}
