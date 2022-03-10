import 'package:flutter/material.dart';

class GeneralAlertDialog {
  customAlertDialog(BuildContext context, String message) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Error Occurred"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Ok"),
          )
        ],
      ),
    );
  }

  customLoadingDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Row(
          children: const [
            CircularProgressIndicator(),
            SizedBox(
              width: 10,
            ),
            Text("Please Wait..."),
          ],
        ),
      ),
    );
  }
}
