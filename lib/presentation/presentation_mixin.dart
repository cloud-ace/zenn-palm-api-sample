import 'package:flutter/material.dart';
import 'package:palm_sample/presentation/view_utils.dart';

/// プレゼンテーション層用のエラーハンドリングをラップした共通処理 Mixin
mixin PresentationMixin {
  Future<void> execute(
    BuildContext context, {
    required Future<void> Function() action,
    required String successMessage,
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await action();
      ViewUtils.instance.showSnackBar(
        scaffoldMessenger,
        message: successMessage,
      );
    } catch (e) {
      ViewUtils.instance.showSnackBar(
        scaffoldMessenger,
        message: e.toString(),
        mode: SnackBarMode.failure,
      );
    }
  }
}
