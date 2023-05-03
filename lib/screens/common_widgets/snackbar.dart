import 'package:flutter/material.dart';

snackbarAdding({
  required String text,
  required BuildContext context,
}) {
  return ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        width: 250,
        duration: const Duration(seconds: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: const Color.fromARGB(255, 49, 9, 73),
        content: Center(child: Text(text))));
}

snackbarRemoving({
  required String text,
  required BuildContext context,
}) {
  return ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        width: 250,
        duration: const Duration(seconds: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: const Color.fromARGB(255, 191, 96, 250),
        content: Center(
            child: Text(
          text,
          style: const TextStyle(color: Color.fromARGB(255, 49, 9, 73)),
        ))));
}
