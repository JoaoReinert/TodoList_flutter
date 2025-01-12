import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteButtonDefault extends StatelessWidget {
  const DeleteButtonDefault({super.key, required this.delete});

  final VoidCallback delete;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: delete,
      icon: Icon(
        Icons.delete,
        color: Colors.red,
      ),
    );
  }
}
