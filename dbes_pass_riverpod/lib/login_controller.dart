import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogicController {
  final WidgetRef ref;
  LogicController({required this.ref});
  Future showDialogue(int id, String? title, String? body) async {
    showDialog(
      context: ref.context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title!),
          content: Text(body!),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('Ok'),
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                // await Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const Text('Hello Riverpod!'),
                //   ),
                // );
              },
            )
          ],
        );
      },
    );
  }
}
