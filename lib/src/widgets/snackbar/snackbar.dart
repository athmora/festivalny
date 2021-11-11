import 'package:flutter/material.dart';

enum SnackState { ok, error, loading }

void showCustomSnackbar(
  BuildContext context, {
  required String mensaje,
  required SnackState snackState,
  bool checkIconIfOk = false,
}) {
  Color bgColor = Colors.green;
  Widget icon = const Icon(Icons.check);

  switch (snackState) {
    case SnackState.ok:
      bgColor = Colors.green;
      icon = checkIconIfOk
          ? const Icon(Icons.check, color: Colors.white)
          : const SizedBox();
      break;
    case SnackState.error:
      bgColor = Colors.orange;
      icon = const Icon(Icons.warning_amber_rounded, color: Colors.white);
      break;

    case SnackState.loading:
      bgColor = Colors.amber;
      icon = const CircularProgressIndicator(color: Colors.white);
      break;
  }

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: bgColor,
        content: Row(
          children: [
            Expanded(
              child: Text(
                mensaje,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            icon,
          ],
        ),
      ),
    );
}
