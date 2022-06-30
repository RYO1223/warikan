import 'package:flutter/material.dart';

class ErrorDialog extends AlertDialog {
  ErrorDialog({
    Key? key,
    required this.error,
  }) : super(
          title: const Text('エラーが発生しました'),
          content: Text(error.toString()),
          actions: [
            TextButton(
              child: const Text('エラーを報告'),
              onPressed: () {},
            ),
            TextButton(
              child: const Text('戻る'),
              onPressed: () {},
            ),
          ],
        );

  final dynamic error;
}
