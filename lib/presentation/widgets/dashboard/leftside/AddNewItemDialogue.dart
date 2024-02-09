import 'package:flutter/material.dart';

class AddNewItemDialogue extends StatefulWidget {
  const AddNewItemDialogue({super.key});

  @override
  State<AddNewItemDialogue> createState() => _AddNewItemDialogueState();
}

class _AddNewItemDialogueState extends State<AddNewItemDialogue> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      // Set custom shape and size for the dialog
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      backgroundColor: Colors.white,
      child: Container(
        // Define custom width and height for the dialog
        width: 1150.0,
        height: 730.0,
        padding: const EdgeInsets.fromLTRB(150, 80, 80, 15),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Custom Dialog',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'This is a custom-sized dialog.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
