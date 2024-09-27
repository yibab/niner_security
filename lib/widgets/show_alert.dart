import 'package:flutter/material.dart';

class ShowAlert extends StatelessWidget {
  final String message;

  const ShowAlert({super.key, required this.message});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      title: const Text("Alert"),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
