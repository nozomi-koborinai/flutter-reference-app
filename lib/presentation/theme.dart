import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

/// テーマプロバイダー
final themeProvider = Provider(
  (ref) {
    return ThemeData(
      useMaterial3: true,
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: HexColor('#696969'),
        ),
        iconTheme: IconThemeData(
          color: HexColor('#696969'),
        ),
      ),
    );
  },
);
