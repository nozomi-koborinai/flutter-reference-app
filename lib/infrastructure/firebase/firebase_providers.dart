import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Firestoreのインスタンスを保持するプロバイダ
final firebaseFirestoreProvider = Provider((_) => FirebaseFirestore.instance);
