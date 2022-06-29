import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/data_layer/post_repository.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/time_line_page_view_model.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/views/time_line_page.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
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
      //view生成時、対応するViewModelを渡す
      //さらにViewModel生成時、内部でコールするRepositoryのインスタンスを渡す
      home: TimeLinePage(TimeLinePageViewModel(PostRepository())),
    );
  }
}
