import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/domain/domain_providers.dart';
import 'package:repository_riverpod_mvvm/firebase_options.dart';
import 'package:repository_riverpod_mvvm/infrastructure/infrastructure_providers.dart';
import 'package:repository_riverpod_mvvm/presentation/views/time_line_page.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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
