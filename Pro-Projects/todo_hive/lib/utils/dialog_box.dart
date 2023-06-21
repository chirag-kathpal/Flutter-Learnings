import 'package:flutter/material.dart';
import 'package:todo_hive/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;

  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amberAccent.shade200,
      content: Container(
        height: 150,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            // save button + cancel button

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(onPressed: onSave, text: "Save"),
                const SizedBox(
                  width: 8,
                ),
                MyButton(onPressed: onCancel, text: "Cancel"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
