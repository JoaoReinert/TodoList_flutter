import 'package:flutter/material.dart';

class AlertDialogDefault extends StatelessWidget {
  const AlertDialogDefault({
    super.key,
    required this.title,
    this.performActionText,
    this.exitDialog,
    required this.performActionFunction,
  });

  final Widget title;
  final String? performActionText;
  final String? exitDialog;
  final VoidCallback performActionFunction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            exitDialog ?? 'Não',
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            performActionFunction();
          },
          child: Text(
            performActionText ?? 'Sim',
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
