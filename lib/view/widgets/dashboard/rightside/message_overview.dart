import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';

class MessageOverview extends StatelessWidget {
  const MessageOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'Mark all read',
          style: TextStyle(fontSize: 20),
        ),
        Expanded(child: Container()),
        const Text(
          '2 unread',
          style: TextStyle(color: redColor, fontSize: 20),
        ),
      ],
    );
  }
}
