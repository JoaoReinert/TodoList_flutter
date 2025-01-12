import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditButtonDefault extends StatelessWidget {
  const EditButtonDefault({
    super.key,
    required this.edit,
  });

  final VoidCallback edit;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: edit,
      icon: Icon(
        Icons.edit,
        color: Colors.blue,
      ),
    );
  }
}
